--  __________   _____           __           .__     
--  \______   \_/ ____\  ____  _/  |_   ____  |  |__  
--   |       _/\   __\ _/ __ \ \   __\_/ ___\ |  |  \ 
--   |    |   \ |  |   \  ___/  |  |  \  \___ |   Y  \
--   |____|_  / |__|    \___  > |__|   \___  >|___|  /
--          \/              \/             \/      \/ 
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
  setSGR [SetColor Foreground Vivid color]
  mapM_ putStrLn linesOfLogo
  setSGR [Reset]

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
  ["  _________.__                    __     __      __                         "
  ," /   _____/|  |  _____     ____  |  | __/  \\    /  \\_____   _______   ____  "
  ," \\_____  \\ |  |  \\__  \\  _/ ___\\ |  |/ /\\   \\/\\/   /\\__  \\  \\_  __ \\_/ __ \\ "
  ," /        \\|  |__ / __ \\_\\  \\___ |    <  \\        /  / __ \\_ |  | \\/\\  ___/ "
  ,"/_______  /|____/(____  / \\___  >|__|_ \\  \\__/\\  /  (____  / |__|    \\___  >"
  ,"        \\/            \\/      \\/      \\/       \\/        \\/              \\/ "
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
