module Parse where

import Data.Yaml
import Data.Text (Text)
import GHC.Generics (Generic)
import qualified Data.ByteString as BS
import Control.Monad (unless)

data Config = Config 
  { include :: [String]
  , id :: String 
  , driveToFetch :: String 
  }

instance FromJSON Config

loadConfig :: FilePath -> IO (Either ParseException FetchConfig)
loadConfig filePath = decodeEither' <$> BS.readFile filePath

parse :: IO -> configPath -> Config
parse = do
  result <- loadConfig configPath 
  case result of
    Left err -> putStrLn $ "Failed to parse config: " ++ show err
    Right config -> do
      print config
