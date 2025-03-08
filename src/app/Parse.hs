module Parse where

import System.Process

hostnameGet, kernelGet, getRAM, distroGet :: IO String 

hostnameGet = readProcess "hostname" [] ""

kernelGet = readProcess "uname" ["-r"] ""

getRAM = do
    output <- readProcess "free" ["-h"] ""
    let rawLine = words $ lines output !! 1
        total = rawLine !! 1
        used = rawLine !! 2
    return $ used ++ " / " ++ total ++ " "
		
distroGet = do 
    name <- readProcess "." ["/etc/os-release", "&&", "echo", "$NAME"] ""
    version <- readProcess "." ["/etc/os-release", "&&", "echo", "$VERSION"] ""
    versionCodename <- readProcess "." ["/etc/os-release", "&&", "echo", "$VERSION_CODENAME"] ""
    return $ name ++ " " ++ version ++ " " ++versionCodename
	
