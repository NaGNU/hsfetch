module PkgManagers where

import System.Process
import System.Directory (findExecutable)
import Data.Maybe (isJust) 

checkPkgManager :: IO String

checkPkgManager = do 
    apt <- findExecutable "apt"
    dnf <- findExecutable "dnf"
    pacman <- findExecutable "pacman"
    zypper <- findExecutable "zypper"
    slackpkg <- findExecutable "/usr/sbin/slackpkg"
    emerge <- findExecutable "emerge"

    return $ case () of 
        _ | isJust apt -> "apt"
          | isJust dnf -> "dnf"
          | isJust pacman -> "pacman"
          | isJust zypper -> "zypper"
          | isJust slackpkg -> "slackpkg"
          | isJust emerge -> "emerge"
          | otherwise -> "-"
