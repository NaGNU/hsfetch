import System.Process
import System.Console.ANSI
import Parse

main :: IO ()
main = do
	hostname <- hostnameGet
	putStrLn $ "hostname: " ++ hostname
