{ pkgs, ... }:

let
  tar = "${pkgs.gnutar}/bin/tar";
  xz = "${pkgs.xz}/bin/xz";
  unzip = "${pkgs.unzip}/bin/unzip";
  unrar = "${pkgs.unrar}/bin/unrar";
  ssconvert= "${pkgs.gnumeric}/bin/ssconvert";
  docx2txt = "${pkgs.python311Packages.docx2txt}/bin/docx2txt";
  catdoc = "${pkgs.catdoc}/bin/catdoc";
  odt2txt = "${pkgs.odt2txt}/bin/odt2txt";
  iso-info = "${pkgs.libcdio}/bin/iso-info";
  SevenZip = "${pkgs.p7zip}/bin/p7zip";
  bat = "${pkgs.bat}/bin/bat";
  pdftoppm = "${pkgs.poppler_utils}/bin/pdftoppm";
  transmission-show = "${pkgs.transmission}/bin/transmission-show";


  
  previewer = pkgs.writeShellScript "previewer" ''
image() {
    FILE_PATH="$1"
    X=$4
    Y=$5
    MW=$(($2-1))
    MH=$3
    ueberzugpp cmd -s $UB_SOCKET -a add -i PREVIEW -x $X -y $Y --max-width $MW --max-height $MH -f "$FILE_PATH"
    exit 1
}

CACHE="$HOME/.cache/lf/thumbnail.$(stat --printf '%n\0%i\0%F\0%s\0%W\0%Y' -- "$(readlink -f "$1")" | sha256sum | awk '{print $1}'))"

case "$(printf "%s\n" "$(readlink -f "$1")" | awk '{print tolower($0)}')" in
	*.tgz|*.tar.gz) ${tar} tzf "$1" ;;
	*.tar.bz2|*.tbz2) ${tar} tjf "$1" ;;
	*.tar.txz|*.txz) ${xz} --list "$1" ;;
	*.tar) ${tar} tf "$1" ;;
	*.zip|*.jar|*.war|*.ear|*.oxt) ${unzip} -l "$1" ;;
	*.rar) ${unrar} l "$1" ;;
	*.7z) ${SevenZip} l "$1" ;;
	*.[1-8]) man "$1" | col -b ;;
	*.o) nm "$1";;
	*.torrent) ${transmission-show} "$1" ;;
	*.iso) ${iso-info} --no-header -l "$1" ;;
	*.odt|*.ods|*.odp|*.sxw) ${odt2txt} "$1" ;;
	*.doc) ${catdoc} "$1" ;;
	*.docx) ${docx2txt} "$1" - ;;
	*.xls|*.xlsx)
		${ssconvert} --export-type=Gnumeric_stf:stf_csv "$1" "fd://1" | ${bat} --language=csv
		;;
	*.wav|*.mp3|*.flac|*.m4a|*.wma|*.ape|*.ac3|*.og[agx]|*.spx|*.opus|*.as[fx]|*.mka)
		exiftool "$1"
		;;
	*.pdf)
		[ ! -f "''${CACHE}.jpg" ] && \
			${pdftoppm} -jpeg -f 1 -singlefile "$1" "$CACHE"
		image "''${CACHE}.jpg" "$2" "$3" "$4" "$5"
		;;
	*.avi|*.mp4|*.wmv|*.dat|*.3gp|*.ogv|*.mkv|*.mpg|*.mpeg|*.vob|*.fl[icv]|*.m2v|*.mov|*.webm|*.ts|*.mts|*.m4v|*.r[am]|*.qt|*.divx)
		[ ! -f "''${CACHE}.jpg" ] && \
			ffmpegthumbnailer -i "$1" -o "''${CACHE}.jpg" -s 0 -q 5
		image "''${CACHE}.jpg" "$2" "$3" "$4" "$5"
		;;
	*.bmp|*.jpg|*.jpeg|*.png|*.xpm|*.webp|*.gif|*.jfif)
		image "$1" "$2" "$3" "$4" "$5"
		;;
	*.svg)
    		[ ! -f "''${CACHE}.jpg" ] && \
      		convert "$1" "''${CACHE}.jpg"
    		image "''${CACHE}.jpg" "$2" "$3" "$4" "$5"
    		;;
	*)
		${bat} "$1"
		;;
esac
exit 0
  '';
  cleaner = pkgs.writeShellScript "cleaner" ''
ueberzugpp cmd -s $UB_SOCKET -a remove -i PREVIEW
'';
in
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
      shellopts = "-eu";
      ifs = "\\n";
      scrolloff = 10;
      period = 1;
      icons = true;
    };
    extraConfig = ''
set previewer ${previewer}
set cleaner ${cleaner}

map cc push A<c-u> # new rename
map I push A<c-a> # at the very beginning
map i push A<a-b><a-b><a-f> # before extention
map a push A<a-b> # after extention
map br vimv # Bulk rename du répertoire actuel

# Commandes générales
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
cmd sk_jump ''${{
    res="$(sk --reverse --header='Rechercher :')"
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
      dragon = ''%xdragon "$f"'';
      trash = ''%set -f; trash "$fx"'';
      vimv = "$vimv";
    };
  };
  xdg.configFile."lf/icons".text = builtins.readFile ./icons;
}
