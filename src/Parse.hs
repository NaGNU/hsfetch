--  __________   _____           __           .__     
--  \______   \_/ ____\  ____  _/  |_   ____  |  |__  
--   |       _/\   __\ _/ __ \ \   __\_/ ___\ |  |  \ 
--   |    |   \ |  |   \  ___/  |  |  \  \___ |   Y  \
--   |____|_  / |__|    \___  > |__|   \___  >|___|  /
--          \/              \/             \/      \/ 
--
module Parse where

import System.Process (readProcess)
import PkgManagers
import Data.Char (isSpace)
import Data.List (isPrefixOf, isInfixOf)		
import System.Console.ANSI
import Text.Printf (printf)

hostnameGet, kernelGet, getRAM, distroGet, idGet, installDataGet, uptimeGet :: IO String 
getListPkg :: String -> IO String

getListPkg "apt" = return "422" -- readProcess "dpkg" ["--list"] ""
getListPkg "dnf" = return "422" --  readProcess "dnf" ["list", "installed"] ""
getListPkg "pacman" = return "422"-- readProcess "pacman" ["-Q"] ""
getListPkg "zypper" = return "422"-- readProcess "zypper" ["se", "-i"] ""
getListPkg "slackpkg" = readProcess "ls" ["/var/log/packages"] ""
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
    if output == "-"
    then return "-"
    else return $ show (length $ lines output) ++ "\n"

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

uptimeGet = do
    uptimeStr <- readFile "/proc/uptime"
    let uptimeSeconds = read (head (words uptimeStr)) :: Double
        totalSeconds = floor uptimeSeconds :: Int
        (days, remainder) = totalSeconds `divMod` (60 * 60 * 24)
        (hours, remainder2) = remainder `divMod` (60 * 60)
        (minutes, _) = remainder2 `divMod` 60
    return $ printf "%d days, %02d hours, %02d minutes" days hours minutes

