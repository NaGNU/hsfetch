{ mkDerivation, ansi-terminal, base, directory, lib, parsec
, process, yaml
}:
mkDerivation {
  pname = "hsfetch";
  version = "1.3.1.0";
  src = ./.;
  isLibrary = false;
  isExecutable = true;
  executableHaskellDepends = [
    ansi-terminal base directory parsec process yaml
  ];
  homepage = "https://github.com/nagnu/hsfetch";
  license = lib.licenses.gpl3Plus;
  mainProgram = "hsfetch";
}
