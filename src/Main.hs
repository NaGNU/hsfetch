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
import Control.Concurrent.Async (mapConcurrently, concurrently)
import Control.Exception (evaluate)

putStrColor :: String -> ColorIntensity -> Color -> IO ()
putStrColor string intensity color = do
  setSGR [SetColor Foreground intensity color]
  putStr string 
  setSGR [SetColor Foreground Dull White]

fetchAllData :: IO (String, String, String, String, String, String, String, String, String, String)
fetchAllData = do
    (kernel, ram, distro, pkgs, shell, cpu, idStr, installDate, uptime, wm) <-
        concurrently
            (concurrently kernelGet getRAM)
            (concurrently distroGet pkgsNumGet)
        `concurrently`
            (concurrently shellGet cpuGet)
        `concurrently`
            (concurrently idGet installDataGet)
        `concurrently`
            (concurrently uptimeGet wmGet)
    
    return (kernel, ram, distro, pkgs, shell, cpu, idStr, installDate, uptime, wm)


fetchAllDataGrouped :: IO (String, String, String, String, String, String, String, String, String, String)
fetchAllDataGrouped = do
    -- Группируем независимые операции
    ((kernel, ram), (distro, pkgs), (shell, cpu), (idStr, installDate), (uptime, wm)) <-
        concurrently
            (concurrently kernelGet getRAM)
            (concurrently distroGet pkgsNumGet)
        `concurrently`
            (concurrently shellGet cpuGet)
        `concurrently`
            (concurrently idGet installDataGet)
        `concurrently`
            (concurrently uptimeGet wmGet)
    
    return (kernel, ram, distro, pkgs, shell, cpu, idStr, installDate, uptime, wm)


fetchAllDataParallel :: IO (String, String, String, String, String, String, String, String, String, String)
fetchAllDataParallel = do
    [kernel, ram, distro, pkgs, shell, cpu, idStr, installDate, uptime, wm] <-
        mapConcurrently evaluate
            [ kernelGet
            , getRAM
            , distroGet
            , pkgsNumGet
            , shellGet
            , cpuGet
            , idGet
            , installDataGet
            , uptimeGet
            , wmGet
            ]
    
    return (kernel, ram, distro, pkgs, shell, cpu, idStr, installDate, uptime, wm)

main :: IO ()
main = do
    (kernel, ram, distro, pkgs, shell, cpu, idStr, installDate, uptime, wm) <- fetchAllData
    
    let (intensity, color) = colorGet idStr 
    let ver = "1.3.1.0"

    printLogo
    putStrLn ""

    -- Выводим результаты
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