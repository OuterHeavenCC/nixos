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
      "f" = "fzf_jump";
      "z" = "zi";
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
      "gn" = "cd ~/nixos";
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
      shellopts = "-eu";
      ifs = "\\n";
      scrolloff = 10;
      period = 1;
      icons = true;
    };
    extraConfig = ''
set previewer ctpv
set cleaner ctpvclear
&ctpv -s $id
&ctpvquit $id

map cc push A<c-u> # new rename
map I push A<c-a> # at the very beginning
map i push A<a-b><a-b><a-f> # before extention
map a push A<a-b> # after extention
map br vimv # Bulk rename du répertoire actuel

cmd open ''${{
  case $(file --mime-type $f -bL) in
	image/vnd.djvu|application/pdf|application/octet-stream) setsid -f zathura $fx >/dev/null 2>&1 ;;
  text/*|application/json|x-tex) $EDITOR $fx;;
  text/x-tex) $EDITOR $f;;
	image/x-xcf) setsid -f gimp $f >/dev/null 2>&1 ;;
	image/*) setsid -f imv-dir $f 2>/dev/null;;
	audio/*) mpv --audio-display=no $f ;;
	video/*) setsid -f mpv $f -quiet >/dev/null 2>&1 ;;
  application/vnd.oasis.opendocument|application/vnd.openxmlformats-officedocument.wordprocessingml.document|application/vnd.oasis.opendocument.spreadsheet) setsid -f libreoffice $f ;;
  application/vnd.openxmlformats-officedocument.wordprocessingml.document) setsid -f libreoffice $f ;;
  application/zip) setsid -f ark $f ;;
  application/x-sc) sc-im $f ;;
	application/pdf|application/vnd*|application/epub*|application/x-cbz) setsid -f zathura $fx >/dev/null 2>&1 ;;
  application/x-bittorent) tremc $f ;;
  application/x-tiled-tsx) setsid -f tiled $f ;;
  application/x-tiled-tmx) setsid -f tiled $f ;;
  *) for f in $fx; do setsid -f $OPENER $f >/dev/null 2>&1; done;;
    esac
}}
cmd fzf_jump ''${{
    res="$(fzf --reverse --header='Rechercher :')"
    if [ -f "$res" ]; then
        cmd="select"
    elif [ -d "$res" ]; then
        cmd="cd"
    fi
    lf -remote "send $id $cmd \"$res\""
}}

# Créer un dossier
cmd mkdir ''${{
  printf "Nom du dossier : "
  read ans
  mkdir $ans
}}

# Créer un fichier et l'ouvre dans vim
cmd mkfile ''${{
	printf "Nom du fichier : "
	read ans
	$EDITOR $ans
}}

# Changer les droits d'un fichier
cmd chmod ''${{
    printf "Mode bits : "
    read ans

    for file in "$fx"
      do
        chmod $ans $file
      done

    lf -remote 'send reload'

}}

# Gérer les archives
cmd unarchive ''${{
  case "$f" in
		*.tar.bz2|*.tbz2) tar xvjf "$f" ;;
		*.tar.xz) tar -xf "$f" ;;
		*.tar.gz|*.tgz) tar xvzf "$f" ;;
		*.lzma) unlzma "$f" ;;
		*.bz2) bunzip2 "$f" ;;
		*.rar) unrar x -ad "$f" ;;
		*.gz) gunzip "$f" ;;
		*.tar) tar xvf "$f" ;;
		*.zip) unzip "$f" ;;
		*.Z) uncompress "$f" ;;
		*.7z) 7z x "$f" ;;
		*.xz) unxz "$f" ;;
                *.zst) zstd -d "$f" ;;
		*.exe) cabextract "$f" ;;
		*) printf "extract: '%s' - unknown archive method\\n" "$f" ;;
  esac
}}

'';
    commands = {
      zip = ''%zip -r "$.fip" "$f"'';
      tar = ''%tar cvf "$f.tar" "$f"'';
      targz = ''%tar czvf "$f.tar.gz" "$f"'';
      tarbz2 = ''%tar cjvf "$f.tar.bz2" "$f"'';
      dragon = ''%ripdrag "$f"'';
      trash = ''%set -f; trash "$fx"'';
      vimv = "$vimv";
    };
  };

  xdg.configFile."lf/icons".text = builtins.readFile ./icons;
}
