module Parsen where

import System.Process

hostnameGet, kernelGet, getRAM, distroGet :: IO String 

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


