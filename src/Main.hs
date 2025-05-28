--  __________   _____           __           .__     
--  \______   \_/ ____\  ____  _/  |_   ____  |  |__  
--   |       _/\   __\ _/ __ \ \   __\_/ ___\ |  |  \ 
--   |    |   \ |  |   \  ___/  |  |  \  \___ |   Y  \
--   |____|_  / |__|    \___  > |__|   \___  >|___|  /
--          \/              \/             \/      \/ 
--
import System.Console.ANSI
import Parse
import Logos

putStrColor :: String -> ColorIntensity -> Color -> IO ()
putStrColor string intensity color = do
  setSGR [SetColor Foreground intensity color]
  putStr string 
  setSGR [SetColor Foreground Dull White]

main :: IO ()
main = do
    kernel      <- kernelGet
    ram         <- getRAM
    distro      <- distroGet
    pkgs        <- pkgsNumGet
    shell       <- shellGet
    cpu         <- cpuGet
    idStr       <- idGet
    installDate <- installDataGet
    uptime      <- uptimeGet
    wm          <- wmGet

    let (intensity, color) = colorGet idStr 
    
    let ver = "1.3.1.0"

    printLogo

    putStrLn ""

    putStrColor "OS: " intensity color
    putStr distro 

    putStrColor "CPU: " intensity color
    putStrLn cpu

    putStrColor "RAM: " intensity color
    putStrLn ram
    
    putStrColor "UPTIME: " intensity color
    putStrLn uptime
    
    putStrColor "WM: " intensity color
    putStrLn wm

    putStrColor "PKGS: " intensity color
    putStr pkgs

    putStrColor "Install data: " intensity color
    putStrLn installDate

    putStrColor "Kernel: " intensity color
    putStr kernel

    putStrColor "Shell: " intensity color
    putStr shell

    putStrColor "HSFetch: " intensity color
    putStrLn ver

