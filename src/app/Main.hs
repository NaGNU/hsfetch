import System.Process
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
	mail <- mailGet

	putStr asciiArt

	putStr "OS: "
	putStr distro 

	putStr "Packages: "
	putStr pkgs

	putStr "Kernel: "
	putStr kernel

	putStr "Shell: "
	putStr shell
	
	putStr "Mail: "
	putStr mail

	putStr "RAM: "
	putStr ram
	putStr "\n"
