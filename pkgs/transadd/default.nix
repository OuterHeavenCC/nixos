{
  lib,
  writeShellApplication,
  coreutils,
  libnotify,
  sysvtools,
  transmission,
}:
(writeShellApplication {
  name = "transadd";
  runtimeInputs = [
    coreutils
    libnotify
    sysvtools
    transmission
  ];
  text = builtins.readFile ./transadd.sh;
})
// {
  meta = with lib; {
    licenses = licenses.mit;
    platforms = platforms.all;
    mainProgram = "transadd";
  };
}

