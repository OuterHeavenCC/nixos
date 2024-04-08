{ pkgs, config, ... }:
let
  zoxide = "${pkgs.zoxide}/bin/zoxide";
  lf = "${pkgs.lf}/bin/lf";
  fzf = "${pkgs.fzf}/bin/fzf";
  skim = "${pkgs.skim}/bin/sk";
  rg = "${pkgs.ripgrep}/bin/rg";
  cfg = config.xdg;
in {
  programs.lf = {
    enable = true;
    keybindings = {
      m = "";
      n = "";
      d = "";
      c = "";
      e = "";
      y = "";
      r = "";
      "." = "set hidden!";
      f = "sk_jump";
      x = "unarchive";
      "<c-r>" = "reload";
      "<enter>" = "enter";
      o = "open";
      C = "clear";
      U = "unselect";
      dd = "cut";
      dr = "xdragon";
      p = "paste";
      yy = "copy";
      mkf = "mkfile";
      mkd = "mkdir";
      tp = "trash";
      D = "delete";
      chm = "chmod";
      z = "zi";

      A = "rename";

      gr = "cd /";
      "g/" = "cd /";
      ge = "cd /etc/";
      gn = "cd ~/Documents/git/nixos";
      gh = "cd ~";
      gc = "cd ${cfg.configHome}";
      gl = "cd ~/.local";
      gsh = "cd ~/.local/bin";
      gd = "cd ${cfg.userDirs.documents}";
      gD = "cd /mnt";
      gi = "cd ${cfg.userDirs.pictures}";
      gt = "cd ${cfg.userDirs.download}";
      gv = "cd ${cfg.userDirs.videos}";
      cc = "push A<c-u>"; # new rename
      I = "push A<c-a>"; # at the very beginning
      i = "push A<a-b><a-b><a-f>"; # before extention
      a = "push A<a-b>"; # after extention
      br = "vimv"; # Bulk rename du répertoire actuel
    };
    settings = {
      drawbox = true;
      ifs = "\\n";
      scrolloff = 10;
      period = 1;
      icons = true;
      sixel = true;
      mouse = true;
    };
    commands = {
      zip = ''%zip -r "$.fip" "$f"'';
      tar = ''%tar cvf "$f.tar" "$f"'';
      targz = ''%tar czvf "$f.tar.gz" "$f"'';
      tarbz2 = ''%tar cjvf "$f.tar.bz2" "$f"'';
      xdragon = ''%xdragon "$f"'';
      trash = ''%set -f; trash "$fx"'';
      vimv = "$vimv";
      open = ''
        ''${{
          case $(file --mime-type $f -bL) in
            image/vnd.djvu|application/pdf|application/octet-stream) setsid -f zathura $fx >/dev/null 2>&1 ;;
            text/*|application/json|x-tex) $EDITOR $fx;;
            text/x-tex) $EDITOR $f;;
            text/javascript) $EDITOR $f;;
            image/x-xcf) setsid -f gimp $f >/dev/null 2>&1 ;;
            image/*) setsid -f imv-dir $f 2>/dev/null;;
            audio/*) mpv --audio-display=no $f ;;
            video/*) setsid -f mpv $f -quiet >/dev/null 2>&1 ;;
            application/vnd.oasis.opendocument|application/vnd.openxmlformats-officedocument.wordprocessingml.document|application/vnd.oasis.opendocument.spreadsheet) setsid -f libreoffice $f ;;
            application/vnd.openxmlformats-officedocument.wordprocessingml.document) setsid -f libreoffice $f ;;
            application/pdf|application/vnd*|application/epub*|application/x-cbz) setsid -f zathura $fx >/dev/null 2>&1 ;;
               *) for f in $fx; do setsid -f $OPENER $f >/dev/null 2>&1; done;;
               esac
               }}
      '';
      sk_jump = ''
        ''${{
        res="$(${skim} --reverse --header='Rechercher :')"
        if [ -f "$res" ]; then
        cmd="select"
        elif [ -d "$res" ]; then
        cmd="cd"
        fi
        ${lf} -remote "send $id $cmd \"$res\""
        }}
      '';
      unarchive = ''
        ''${{
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
      mkdir = ''
        ''${{
        printf "Nom du dossier : "
        read ans
        mkdir $ans
        }}
      '';
      mkfile = ''
        ''${{
        printf "Nom du fichier : "
        read ans
        $EDITOR $ans
        }}
      '';
      chmod = ''
        ''${{
        printf "Mode bits : "
        read ans

        for file in "$fx"
        do
        chmod $ans $file
        done

        ${lf} -remote 'send reload'
        }}
      '';
      fzf_search = ''
               ''${{
               res="$( \
          RG_PREFIX="${rg} --column --line-number --no-heading --color=always \
            --smart-case "
            FZF_DEFAULT_COMMAND="$RG_PREFIX '''" \
            ${fzf} --bind "change:reload:$RG_PREFIX {q} || true" \
            --ansi --layout=reverse --header 'Search in files' \
            | cut -d':' -f1
            )"
            [ ! -z "$res" ] && ${lf} -remote "send $id select \"$res\""
        }}
      '';
      z = ''
        %{{
          ${zoxide} result="$( query --exclude $PWD $@)"
            ${lf} -remote "send $id cd $result"
        }}
      '';
      zi = ''
        ''${{
          result="$(${zoxide} query -i)"
            ${lf} -remote "send $id cd $result"
        }}
      '';
    };

    previewer.source = ./preview;

  };
  xdg.configFile."lf/icons".text = builtins.readFile ./icons;
}
