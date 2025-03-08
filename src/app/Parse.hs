module Parse where

import System.Process

hostnameGet :: IO String 
hostnameGet = readProcess "hostname" [] ""
		
