{ config, ... }:

let
  cfg = config.xdg;
in
{
  programs.zsh = {
    enable = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    syntaxHighlighting = {
      enable = true;
    };
    dotDir = ".config/zsh";
    initExtraFirst = "
      autoload -U colors && colors
      autoload -U compinit promptinit
      PS1=\"%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b \"

    ";
    initExtra = "
      zstyle ':completion:*' menu select
      zmodload zsh/complist\n# Use vim keys in tab complete menu:
      bindkey -M menuselect 'h' vi-backward-char
      bindkey -M menuselect 'k' vi-up-line-or-history
      bindkey -M menuselect 'l' vi-forward-char
      bindkey -M menuselect 'j' vi-down-line-or-history
      bindkey -v '^?' backward-delete-char

      # Change cursor shape for different vi modes.
      function zle-keymap-select () {
          case $KEYMAP in
              vicmd) echo -ne \'\\e[1 q\';;
              viins|main) echo -ne \'\\e[5 q\';;
          esac
      }
      zle -N zle-keymap-select
      zle-line-init() {
          zle -K viins
          echo -ne \"\\e[5 q\"
      }
      zle -N zle-line-init
      echo -ne \'\\e[5 q\'
      preexec() { echo -ne \'\\e[5 q\' ;}
      eval \"$(zoxide init zsh)\"
";
    shellAliases = {
      cp = "cp -iv";
      mv = "mv -iv";
      rm = "rm -vI";
      du = "dust";
      df = "duf";
      nohup = "nohup $@ > /dev/null";
      bc = "eva";
      mkd = "mkdir -pv";
      mpv = "setsid -f mpv";
      mvd = "mullvad";
      tsm = "transmission-remote";
      cd = "z";
      ledger = "ledger --init-file='${cfg.configHome}/ledger/ledgerrc'";
      ls = "eza -h --color=auto --group-directories-first --icons";
      grep = "grep --color=auto";
      diff = "diff --color=auto";
      ka = "killall";
      sdn = "doas shutdown -h now";
      wget = ''wget --hsts-file="${cfg.dataHome}/wget-hsts"'';
      groff = ''groff -k'';
      nixpkgs = "nix-env -f '<nixpkgs>'";
      nix-shell = "nix-shell --command zsh";
    };
    history = {
      path = "${cfg.dataHome}/history";
      size = 10000000;
    };
  };
}

