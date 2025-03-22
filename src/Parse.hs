module Parse where

import System.Process (readProcess)
import PkgManagers
import Data.Char (isSpace)
import Data.List (isPrefixOf, isInfixOf)		
import System.Console.ANSI 

hostnameGet, kernelGet, getRAM, distroGet, idGet, installDataGet  :: IO String 
getListPkg :: String -> IO String

getListPkg "apt" = readProcess "dpkg" ["--list"] ""
getListPkg "dnf" = readProcess "dnf" ["list", "installed"] ""
getListPkg "pacman" = readProcess "pacman" ["-Q"] ""
getListPkg "zypper" = readProcess "zypper" ["se", "-i"] ""
getListPkg "slackpkg" = readProcess "yes" [""] ""
getListPkg "emerge" = readProcess "cat" ["/var/lib/portage/world"] ""
getListPkg _ = return "-"

hostnameGet = readProcess "hostname" [] ""

usernameGet = readProcess "whoami" [] ""

kernelGet = readProcess "uname" ["-r"] ""

getRAM = do
    output <- readProcess "free" ["-h"] ""
    let rawLine = words $ lines output !! 1
        total = rawLine !! 1
        used = rawLine !! 2
    return $ used ++ " / " ++ total ++ " "
		
distroGet = do 
    name <- readProcess "sh" ["-c", ". /etc/os-release && echo $NAME"] ""
    version <- readProcess "sh" ["-c", ". /etc/os-release && echo $VERSION"] ""
    versionCodename <- readProcess "sh" ["-c", ". /etc/os-release && echo $VERSION_CODENAME"] ""
    return $ filter (/= '\n') name ++ " " ++ filter (/= '\n') version ++ " " ++ versionCodename

pkgsNumGet = do
    pkgManager <- checkPkgManager  	
    output <- getListPkg pkgManager
    return $ show (length $ lines output) ++ "\n"

shellGet = readProcess "sh" ["-c", "echo $SHELL"] ""

cpuGet = do
    cpuInfo <- readFile "/proc/cpuinfo"  
    let modelNameLine = head (filter ("model name" `isPrefixOf`) (lines cpuInfo))  
    return $ drop 2 (dropWhile (/= ':') modelNameLine)

idGet = readProcess "sh" ["-c", ". /etc/os-release && echo $ID"] ""

colorGet :: String -> (ColorIntensity, Color) 
colorGet id = case id of
    "slackware\n"  -> (Vivid, Blue) 
    "ptu\n"        -> (Vivid, Red) 
    "arch\n"       -> (Dull, Cyan) 
    "fedora\n"     -> (Vivid, Blue)
    "void\n"       -> (Vivid, Green)
    "artix\n"      -> (Dull, Cyan)
    "mint\n"       -> (Dull, Green)
    "debian\n"     -> (Vivid, Red)
    "ubuntu\n"     -> (Vivid, Yellow)
    _              -> (Dull, White) 

installDataGet = do
    versionInfo <- readFile "/proc/version"
    let afterPreempt = dropWhile (not . isPrefixOf "PREEMPT_DYNAMIC") (wordsBySpace versionInfo)
        dateWords = drop 1 afterPreempt
    return $ unwords $ take 6 dateWords

wordsBySpace :: String -> [String]
wordsBySpace = words

