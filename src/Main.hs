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

    let (intensity, color) = colorGet idStr 
    
    let ver = "1.2"

    printLogo

    putStrLn ""

    setSGR [SetColor Foreground intensity color]
    putStr "OS: "
    setSGR [SetColor Foreground Dull White]
    putStr distro 

    setSGR [SetColor Foreground intensity color]
    putStr "CPU: "
    setSGR [SetColor Foreground Dull White]
    putStr cpu

    putStr "\n"

    setSGR [SetColor Foreground intensity color]
    putStr "RAM: "
    setSGR [SetColor Foreground Dull White]
    putStr ram

    putStr "\n"

    setSGR [SetColor Foreground intensity color]
    putStr "Packages: "
    setSGR [SetColor Foreground Dull White]
    putStr pkgs

    setSGR [SetColor Foreground intensity color]
    putStr "Install Date: "
    setSGR [SetColor Foreground Dull White]
    putStr installDate

    putStr "\n"
    setSGR [SetColor Foreground intensity color]
    putStr "Kernel: "
    setSGR [SetColor Foreground Dull White]
    putStr kernel

    setSGR [SetColor Foreground intensity color]
    putStr "Shell: "
    setSGR [SetColor Foreground Dull White]
    putStr shell
	
    setSGR [SetColor Foreground intensity color]
    putStr "Rfetch: "
    setSGR [SetColor Foreground Dull White]
    putStr ver
    putStr "\n"

