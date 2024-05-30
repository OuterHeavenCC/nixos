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
  anyrun,

}:
(writeShellApplication {
  name = "powermenu";
  runtimeInputs = [
    fuzzel
    anyrun
    findutils
    coreutils
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
