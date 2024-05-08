{
  lib,
  writeShellApplication,
  fuzzel,
  findutils,
  coreutils,
  swaylock,
  gnugrep,
  systemd,

}:
(writeShellApplication {
  name = "powermenu";
  runtimeInputs = [
    fuzzel
    findutils
    coreutils
    swaylock
    gnugrep
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

