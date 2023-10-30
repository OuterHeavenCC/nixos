{ pkgs, ... }:

{
    home.packages = with pkgs; [
      ytfzf
    ];
    xdg.configFile."ytfzf/conf.sh".text = ''
      external_menu() {
        fuzzel -d -w 60 -p "Rechercher : "
      }
    '';
}
