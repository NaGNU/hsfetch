import System.Process
import System.Console.ANSI
import Parse

main :: IO ()
main = do
	hostname <- hostnameGet
	kernel <- kernelGet
	ram <- getRAM
	distro <- distroGet
	putStr "OS: "
	putStr distro
	putStr "hostname: " 
	putStr hostname
	putStr "kernel: "
	putStr kernel
	putStr "RAM: "
	putStr ram
	putStr "\n"
