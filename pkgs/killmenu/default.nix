{
  lib,
  writeShellApplication,
  coreutils,
  fuzzel,
  gawk,
  procps,
}:
(writeShellApplication {
  name = "killmenu";
  runtimeInputs = [
    coreutils
    fuzzel
    gawk
    procps
  ];
  text = builtins.readFile ./killmenu.sh;
})
// {
  meta = with lib; {
    licenses = licenses.mit;
    platforms = platforms.all;
    mainProgram = "killmenu";
  };
}

