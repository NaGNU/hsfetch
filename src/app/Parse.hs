module Parse where

import System.Process
import System.Directory

hostnameGet, kernelGet, getRAM, distroGet, pkgsNumGet :: IO String 

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
    output <- readProcess "ls" ["/var/log/packages"] ""
    return $ show (length $ lines output) ++ "\n"

shellGet = readProcess "sh" ["-c", "echo $SHELL"] ""

mailGet = readProcess "sh" ["-c", "echo $MAIL"] ""

pkgmanagerGet = do
    let managers  = [ ("/var/lib/dpkg/status", "dpkg (Debian-based)")
                   , ("/var/lib/pacman/local/", "pacman (Arch-based)")
                   , ("/var/lib/rpm/", "rpm (Fedora/RHEL-based)")
                   , ("/var/log/packages/", "Slackware pkgtools")
                   , ("/opt/homebrew/bin/brew", "Homebrew (MacOS)")
                   ]
    found <- filterM (doesFileExist . fst) managers
	return $ if null found then "-" else snd $ head found
