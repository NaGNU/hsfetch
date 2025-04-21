--  __________   _____           __           .__     
--  \______   \_/ ____\  ____  _/  |_   ____  |  |__  
--   |       _/\   __\ _/ __ \ \   __\_/ ___\ |  |  \ 
--   |    |   \ |  |   \  ___/  |  |  \  \___ |   Y  \
--   |____|_  / |__|    \___  > |__|   \___  >|___|  /
--          \/              \/             \/      \/ 
--
module PkgManagers where

import System.Process
import System.Directory (findExecutable, emptyPermissions)
import Data.Maybe (isJust) 

checkPkgManager :: IO String

checkPkgManager = do 
    apt <- findExecutable "apt"
    dnf <- findExecutable "dnf"
    pacman <- findExecutable "pacman"
    zypper <- findExecutable "zypper"
    slackpkg <- findExecutable "/sbin/installpkg"
    emerge <- findExecutable "emerge"
    base <- findExecutable "base"
    pure <- findExecutable "purepkg"

    return $ case () of 
        _ | isJust apt -> "apt"
          | isJust dnf -> "dnf"
          | isJust pacman -> "pacman"
          | isJust zypper -> "zypper"
          | isJust slackpkg -> "slackpkg"
          | isJust emerge -> "emerge"
          | isJust base -> "base"
          | isJust pure -> "purepkg"
          | otherwise -> "-"
