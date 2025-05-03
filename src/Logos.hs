--   __    __  ______   ______           __              __       
--  |  \  |  \/      \ /      \         |  \            |  \      
--  | $$  | $|  $$$$$$|  $$$$$$\______ _| $$_    _______| $$____  
--  | $$__| $| $$___\$| $$_  \$/      |   $$ \  /       | $$    \ 
--  | $$    $$\$$    \| $$ \  |  $$$$$$\$$$$$$ |  $$$$$$| $$$$$$$\
--  | $$$$$$$$_\$$$$$$| $$$$  | $$    $$| $$ __| $$     | $$  | $$
--  | $$  | $|  \__| $| $$    | $$$$$$$$| $$|  | $$_____| $$  | $$
--  | $$  | $$\$$    $| $$     \$$     \ \$$  $$\$$     | $$  | $$
--  \ $$   \$$ \$$$$$$ \$$     \$$$$$$$  \$$$$  \$$$$$$$\ $$   \$$
--                                                                
--                                                                
--                                                                        
module Logos 
  ( archLogo
  , debianLogo
  , slackwareLogo
  , fedoraLogo
  , gentooLogo
  , voidLogo
  , alpineLogo
  , ubuntuLogo
  , opensuseLogo
  , artixLogo
  , kaliLogo
  , nixosLogo
  , parrotLogo
  , endeavourLogo
  , mintLogo
  , linuxLogo
  , nurosLogo
  , printLogoWithColor
  , printLogo
  ) where

import Parse
import System.Console.ANSI

printLogo :: IO ()
printLogo = do
    distroId <- idGet
    case distroId of
        "arch\n"      -> archLogo
        "slackware\n" -> slackwareLogo
        "void\n"      -> voidLogo
        "nuros\n"     -> nurosLogo
        "nixos\n"     -> nixosLogo
        "ubuntu\n"    -> ubuntuLogo
        "fedora\n"    -> fedoraLogo
        "gentoo\n"    -> gentooLogo
        "alpine\n"    -> alpineLogo
        "artix\n"     -> artixLogo
        "kali\n"      -> kaliLogo
        "parrot\n"    -> parrotLogo
        "mint\n"      -> mintLogo
        "ptu\n"       -> ptyLogo
        "buildx\n"    -> buildXLogo
        _             -> linuxLogo

printLogoWithColor :: Color -> [String] -> IO ()
printLogoWithColor color linesOfLogo = do
  setSGR [SetColor Foreground Dull color]
  mapM_ putStrLn linesOfLogo
  setSGR [Reset]


nurosLogo :: IO ()
nurosLogo = printLogoWithColor Blue
  [ " __    __                    ______   ______  "
  , "/  \\  /  |                  /      \\ /      \\ "
  , "$$  \\ $$ |__    __  ______ /$$$$$$  /$$$$$$  |"
  , "$$$  \\$$ /  |  /  |/      \\$$ |  $$ $$ \\__$$/ "
  , "$$$$  $$ $$ |  $$ /$$$$$$  $$ |  $$ $$      \\ "
  , "$$ $$ $$ $$ |  $$ $$ |  $$/$$ |  $$ |$$$$$$  |"
  , "$$ |$$$$ $$ \\__$$ $$ |     $$ \\__$$ /  \\__$$ |"
  , "$$ | $$$ $$    $$/$$ |     $$    $$/$$    $$/ "
  , "$$/   $$/ $$$$$$/ $$/       $$$$$$/  $$$$$$/  "
  ]

linuxLogo :: IO ()
linuxLogo = printLogoWithColor White
  [ "        .--."
  , "       |o_o |"
  , "       |:_/ |"
  , "      //   \\\\"
  , "     (|     | )"
  , "    /'\\_   _/`\\"
  , "    \\___)=(___/"
  ]

ptyLogo :: IO ()
ptyLogo = printLogoWithColor Red
    [""
    ,"88\"\"Yb 888888 88   88    dP  dP\"Yb  .dP\"Y8"
    ,"88__dP   88   88   88   dP  dP   Yb  Ybo."
    ,"88\"\"\"    88   Y8   8P  dP   Yb   dP o.`Y8b" 
    ,"88       88   `YbodP' dP     YbodP  8bodP'"
    ]

buildXLogo = printLogoWithColor Cyan
    [""
    ,"$$$$$$$\\            $$\\ $$\\       $$\\ $$\\   $$\\" 
    ,"$$  __$$\\           \\__|$$ |      $$ |$$ |  $$ |"
    ,"$$ |  $$ |$$\\   $$\\ $$\\ $$ | $$$$$$$ |\\$$\\ $$  |"
    ,"$$$$$$$\\ |$$ |  $$ |$$ |$$ |$$  __$$ | \\$$$$  /" 
    ,"$$  __$$\\ $$ |  $$ |$$ |$$ |$$ /  $$ | $$  $$< " 
    ,"$$ |  $$ |$$ |  $$ |$$ |$$ |$$ |  $$ |$$  /\\$$\\ "
    ,"$$$$$$$  |\\$$$$$$  |$$ |$$ |\\$$$$$$$ |$$ /  $$ |"
    ,"\\_______/  \\______/ \\__|\\__| \\_______|\\__|  \\__|"
    ]


archLogo :: IO ()
archLogo = printLogoWithColor Cyan
    ["__________                     .__      "
    ,"\\ ______  \\  _____      ____   |  |__   "  
    ," |       _/  \\ __ \\   _/ ___\\  |  |  \\  "
    ," |    |   \\  / __ \\_  \\  \\___  |   Y  \\ "
    ," |____|_  / (____  /   \\___  > |___|  / "
    ,"        \\/       \\/        \\/       \\/  "
    ]

debianLogo :: IO ()
debianLogo = printLogoWithColor Red
  [ "      _____ "
  , "     /  __ \\\\"
  , "    |  /    \\\\"
  , "     \\_\\____/ "
  , "        \\_/    "
  ]

slackwareLogo :: IO ()
slackwareLogo = printLogoWithColor Blue
  [ "   _____ __           __  _       __              "
  , "  / ___// ____ ______/ /_| |     / ____ _________ "
  , "  \\__ \\/ / __ `/ ___/ //_| | /| / / __ `/ ___/ _ \\"
  , " ___/ / / /_/ / /__/ ,<  | |/ |/ / /_/ / /  /  __/"
  , "/____/_/\\__,_/\\___/_/|_| |__/|__/\\__,_/_/   \\___/ "
  ]
fedoraLogo :: IO ()
fedoraLogo = printLogoWithColor Blue
  [ "    ______         __                "
  , "   / ____/__  ____/ /___  _________ _"
  , "  / /_  / _ \\/ __  / __ \\/ ___/ __ `/"
  , " / __/ /  __/ /_/ / /_/ / /  / /_/ / "
  , "/_/    \\___/\\__,_/\\____/_/   \\__,_/  "
  ]

gentooLogo :: IO ()
gentooLogo = printLogoWithColor Magenta
  [ "   ___     "
  , "  / __\\  "
  , " / /  \\" 
  , " \\_\\__/  "
  ]

voidLogo :: IO ()
voidLogo = printLogoWithColor Green
  [ "   __     "
  , "  /  \\" 
  , " |  ()  |"
  , "  \\__/ "
  ]

alpineLogo :: IO ()
alpineLogo = printLogoWithColor Cyan
  [ "     /\\   "
  , "    /  \\" 
  , "   / /\\ \\" 
  , "  / /__\\ \\" 
  , " /_/    \\_\\"
  ]

ubuntuLogo :: IO ()
ubuntuLogo = printLogoWithColor Yellow
  [ "   .--.   "
  , "  |o_o |  "
  , "  |:_/ |  "
  , " //   \\" 
  , "( |   | ) "
  , " \\_\\_//_  "
  ]

opensuseLogo :: IO ()
opensuseLogo = printLogoWithColor Green
  [ "    .----.   "
  , "   / .==.\\  "
  , "  / /    \\" 
  , "  \\ \\____// "
  , "   \\_____/  "
  ]

artixLogo :: IO ()
artixLogo = printLogoWithColor Cyan
  [ "     /\\   "
  , "    /  \\" 
  , "   / /\\ \\" 
  , "  / ____ \\" 
  , " /_/    \\_\\"
  ]

kaliLogo :: IO ()
kaliLogo = printLogoWithColor Blue
  [ "     (\\  "
  , "      )) "
  , "     //  "
  , "   ==\\=  "
  ]

nixosLogo :: IO ()
nixosLogo = printLogoWithColor Blue
  [ "   \\ \\   / / "
  , "    \\ \\_/ /  "
  , "     \\___/   "
  , "    / ___ \\" 
  , "   / /   \\" 
  , "  /_/     \\" 
  ]

parrotLogo :: IO ()
parrotLogo = printLogoWithColor Yellow
  [ "   ( \\" 
  , "    ) ) "
  , "   ( (  "
  , "    )_) "
  ]

endeavourLogo :: IO ()
endeavourLogo = printLogoWithColor Magenta
  [ "     /\\   "
  , "    /  \\" 
  , "   / /\\ \\" 
  , "  / ____ \\" 
  , " /_/    \\_\\"
  ]

mintLogo :: IO ()
mintLogo = printLogoWithColor Green
  [ "   _____   "
  , "  |  __ \\" 
  , "  | |__) | "
  , "  |  ___/  "
  , "  |_|      "
  ]
