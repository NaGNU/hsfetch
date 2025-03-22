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
        "arch"      -> archLogo
        "slackware" -> slackwareLogo
        "void"      -> voidLogo
        "nixos"     -> nixosLogo
        "ubuntu"    -> ubuntuLogo
        "fedora"    -> fedoraLogo
        "gentoo"    -> gentooLogo
        "alpine"    -> alpineLogo
        "artix"     -> artixLogo
        "kali"      -> kaliLogo
        "parrot"    -> parrotLogo
        "mint"      -> mintLogo
        _           -> linuxLogo

printLogoWithColor :: Color -> [String] -> IO ()
printLogoWithColor color linesOfLogo = do
  setSGR [SetColor Foreground Dull color]
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

archLogo :: IO ()
archLogo = printLogoWithColor Cyan
    ["__________                    .__      "
    ,"\\ ______   \\ _____      ____   |  |__   "  
    ," |       _/ \\ __  \\   _/ ___\\  |  |  \\  "
    ," |    |   \\  / __ \\ _ \\  \\___  |   Y  \\ "
    ," |____|_  / (____  /  \\___  > |___|  / "
    ,"        \\/       \\/       \\/       \\/  "
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
  [ " _____                  _            "
  , "/  ___|                | |           "
  , "\\ `--.   _ __    __ _  | | __   __ _ "
  , " `--. \\ | '__|  / _` | | |/ /  / _` |"
  , "/\\__/ / | |    | (_| | |   <  | (_| |"
  , "\\____/  |_|     \\__,_| |_|\\_\\  \\__,_|"
  ]

fedoraLogo :: IO ()
fedoraLogo = printLogoWithColor Blue
  [ "    _______ "
  , "   /  ___/ "
  , "  /  /__   "
  , " /_____/   "
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
ubuntuLogo = printLogoWithColor Red
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
