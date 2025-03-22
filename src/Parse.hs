module Parse where

import System.Process (readProcess)
import PkgManagers
import Data.Char (isSpace)
import Data.List (isPrefixOf)		
import System.Console.ANSI 

hostnameGet, kernelGet, getRAM, distroGet, idGet :: IO String 
getListPkg :: String -> IO String

getListPkg "apt" = readProcess "dpkg" ["--list"] ""
getListPkg "dnf" = readProcess "dnf" ["list", "installed"] ""
getListPkg "pacman" = readProcess "pacman" ["-Q"] ""
getListPkg "zypper" = readProcess "zypper" ["se", "-i"] ""
getListPkg "slackpkg" = readProcess "sh" ["-c", "ls /var/log/packages | wc -l"] ""
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
    return $ dropWhile (/= ':') (dropWhile (/= ' ') modelNameLine) 

idGet = readProcess "sh" ["-c", ". /etc/os-release && echo $ID"] ""

colorGet :: String -> (ColorIntensity, Color) 
colorGet id = case id of
    "slackware\n"  -> (Vivid, Blue) 
    "ptu\n"        -> (Vivid, Red) 
    "arch\n"       -> (Dull, Cyan) 
    _              -> (Dull, White) 
