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

main :: IO ()
main = do
    kernel <- kernelGet
    ram <- getRAM
    distro <- distroGet
    pkgs <- pkgsNumGet
    shell <- shellGet
    cpu <- cpuGet
    idStr <- idGet
    installDate <- installDataGet
    uptime <- uptimeGet

    let (intensity, color) = colorGet idStr 
    
    let ver = "1.3.0.0"

    printLogo

    putStrLn ""

    setSGR [SetColor Foreground intensity color]
    putStr "OS: "
    setSGR [SetColor Foreground Dull White]
    putStr distro 

    setSGR [SetColor Foreground intensity color]
    putStr "CPU: "
    setSGR [SetColor Foreground Dull White]
    putStrLn cpu


    setSGR [SetColor Foreground intensity color]
    putStr "RAM: "
    setSGR [SetColor Foreground Dull White]
    putStrLn ram


    setSGR [SetColor Foreground intensity color]
    putStr "Uptime: "
    setSGR [SetColor Foreground Dull White]
    putStrLn uptime
    
    setSGR [SetColor Foreground intensity color]
    putStr "Window Manager: "
    setSGR [SetColor Foreground Dull White]
    wmGet >>= putStrLn

    setSGR [SetColor Foreground intensity color]
    putStr "Packages: "
    setSGR [SetColor Foreground Dull White]
    putStr pkgs

    setSGR [SetColor Foreground intensity color]
    putStr "Install Date: "
    setSGR [SetColor Foreground Dull White]
    putStrLn installDate

    setSGR [SetColor Foreground intensity color]
    putStr "Kernel: "
    setSGR [SetColor Foreground Dull White]
    putStr kernel

    setSGR [SetColor Foreground intensity color]
    putStr "Shell: "
    setSGR [SetColor Foreground Dull White]
    putStr shell

    setSGR [SetColor Foreground intensity color]
    putStr "HSfetch: "
    setSGR [SetColor Foreground Dull White]
    putStrLn ver

