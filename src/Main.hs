import System.Console.ANSI
import Parse

asciiArt :: String

asciiArt = unlines
  [ "      .--. ",
    "     |o_o | ",
    "     |:_/ | ",
    "    //   \\ \\  ",
    "   (|     | ) ",
    "  /'\\_   _/`\\ ",
    "  \\___)=(___/"
  ]

main :: IO ()
main = do
    kernel <- kernelGet
    ram <- getRAM
    distro <- distroGet
    pkgs <- pkgsNumGet
    shell <- shellGet
    cpu <- cpuGet

    let ver = "1.2"

    --setSGR [SetColor Foreground Vivid Blue]

    putStr asciiArt

    setSGR [SetColor Foreground Vivid White]

    putStrLn ""

    setSGR [SetColor Foreground Vivid Blue]
    putStr "OS: "
    setSGR [SetColor Foreground Vivid White]
    putStr distro 

    setSGR [SetColor Foreground Vivid Blue]
    putStr "CPU: "
    setSGR [SetColor Foreground Vivid White]
    putStr cpu

    putStr "\n"

    setSGR [SetColor Foreground Vivid Blue]
    putStr "RAM: "
    setSGR [SetColor Foreground Vivid White]
    putStr ram

    putStr "\n"

    setSGR [SetColor Foreground Vivid Blue]
    putStr "Packages: "
    setSGR [SetColor Foreground Vivid White]
    putStr pkgs

    setSGR [SetColor Foreground Vivid Blue]
    putStr "Kernel: "
    setSGR [SetColor Foreground Vivid White]
    putStr kernel

    setSGR [SetColor Foreground Vivid Blue]
    putStr "Shell: "
    setSGR [SetColor Foreground Vivid White]
    putStr shell
	
    setSGR [SetColor Foreground Vivid Blue]
    putStr "Rfetch: "
    setSGR [SetColor Foreground Vivid White]
    putStr ver
    putStr "\n"
