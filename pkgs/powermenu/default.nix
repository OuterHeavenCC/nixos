{
  lib,
  writeShellApplication,
  fuzzel,
  findutils,
  coreutils,
  hyprlock,
  gnugrep,
  systemd,
}:
(writeShellApplication {
  name = "powermenu";
  runtimeInputs = [
    fuzzel
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
