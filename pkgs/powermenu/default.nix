{
  lib,
  writeShellApplication,
  fuzzel,
  findutils,
  coreutils,
  hyprlock,
  gnugrep,
  systemd,
  inputs,

}:
(writeShellApplication {
  name = "powermenu";
  runtimeInputs = [
    fuzzel
    findutils
    coreutils
    inputs.anyrun.anyrun
    gnugrep
    hyprlock
    systemd
  ];
  text = builtins.readFile ./powermenu.sh;
})
// {
  meta = with lib; {
    licenses = licenses.mit;
    platforms = platforms.all;
    mainProgram = "powermenu";
  };
}

