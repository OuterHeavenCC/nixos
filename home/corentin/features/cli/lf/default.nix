{ pkgs, ... }:

{
  programs.lf = {
    enable = true;
    keybindings = {
      "m" = "";
      "n" = "";
      "d" = "";
      "c" = "";
      "e" = "";
      "y" = "";
      "r" = "";
      "i" = "";
      "." = "set hidden!";
      "f" = "sk_jump";
      "x" = "unarchive";
      "<c-r>" = "reload";
      "<enter>" = "enter";
      "o" = "open";
      "C" = "clear";
      "U" = "unselect";
      "dd" = "cut";
      "dr" = "dragon";
      "p" = "paste";
      "yy" = "copy";
      "mkf" = "mkfile";
      "mkd" = "mkdir";
      "tp" = "trash";
      "D" = "delete";
      "chm" = "chmod";
      "bg" = ''$swww img "$f"'';

      "A" = "rename";
      "br" = "vimv";
      
      "gr" = "cd /";
      "g\/" = "cd /";
      "ge" = "cd /etc/";
      "gn" = "cd ~/Documents/git/nixos";
      "gh" = "cd ~";
      "gc" = "cd ~/.config";
      "gl" = "cd ~/.local";
      "gsh" = "cd ~/.local/bin";
      "gd" = "cd ~/Documents/";
      "gD" = "cd /mnt";
      "gi" = "cd ~/Images";
      "gj" = "cd ~/Jeux";
      "gt" = "cd ~/Téléchargements";
      "gv" = "cd ~/Vidéos";
    };
    settings = {
      drawbox = true;
      ifs = "\\n";
      scrolloff = 10;
      period = 1;
      icons = true;
    };
    commands = {
      zip = ''%zip -r "$.fip" "$f"'';
      tar = ''%tar cvf "$f.tar" "$f"'';
      targz = ''%tar czvf "$f.tar.gz" "$f"'';
      tarbz2 = ''%tar cjvf "$f.tar.bz2" "$f"'';
      dragon = ''%xdragon "$f"'';
      trash = ''%set -f; trash "$fx"'';
      vimv = "$vimv";
    };
    extraConfig = (import ./config.nix {inherit pkgs;});
  };
  xdg.configFile."lf/icons".text = builtins.readFile ./icons;
  xdg.configFile."ctpv/config".text = ''set chafasixel'';           # Sixel previewing with lf-sixel
}
