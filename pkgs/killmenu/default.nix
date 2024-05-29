{
  lib,
  writeShellApplication,
  coreutils,
  inputs,
  gawk,
  procps,
}:
(writeShellApplication {
  name = "killmenu";
  runtimeInputs = [
    coreutils
    inputs.anyrun.anyrun
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
