{ config, ... }:

let
  inherit (config.colorscheme) palette;
in
{

  programs.yazi = {

    theme = {

      manager = {

        cwd = { fg = "#${palette.base0C}"; };

        # Hovered
        hovered = { reversed = true; };
        preview_hovered = { underline = true; };

        # Find
        find_keyword  = { fg = "#${palette.base0A}"; bold = true; italic = true; underline = true; };
        find_position = { fg = "#${palette.base06}"; bg = "reset"; bold = true; italic = true; };

        # Marker
        marker_copied   = { fg = "#${palette.base0B}"; bg = "#${palette.base0B}"; };
        marker_cut      = { fg = "#${palette.base08}"; bg = "#${palette.base08}"; };
        marker_marked   = { fg = "#${palette.base0C}"; bg = "#${palette.base0C}"; };
        marker_selected = { fg = "#${palette.base0A}"; bg = "#${palette.base0A}"; };

        # Tab
        tab_active   = { reversed = true; };
        tab_inactive = {};
        tab_width    = 1;

        # Count
        count_copied   = { fg = "#${palette.base00}"; bg = "#${palette.base0B}"; };
        count_cut      = { fg = "#${palette.base00}"; bg = "#${palette.base08}"; };
        count_selected = { fg = "#${palette.base00}"; bg = "#${palette.base0A}"; };

        # Border
        border_symbol = "│";
        border_style  = { fg = "#7f849c"; };

      };

      status = {

        separator_open  = "";
        separator_close = "";
        separator_style = { fg = "#${palette.base03}"; bg = "#${palette.base03}"; };

        # Mode
        mode_normal = { fg = "#${palette.base00}"; bg = "#${palette.base0D}"; bold = true; };
        mode_select = { fg = "#${palette.base00}"; bg = "#${palette.base0B}"; bold = true; };
        mode_unset  = { fg = "#${palette.base00}"; bg = "#${palette.base0F}"; bold = true; };

        # Progress
        progress_label  = { fg = "#ffffff"; bold = true; };
        progress_normal = { fg = "#${palette.base0D}"; bg = "#${palette.base03}"; };
        progress_error  = { fg = "#${palette.base08}"; bg = "#${palette.base03}"; };

        # Permissions
        permissions_t = { fg = "#${palette.base0D}"; };
        permissions_r = { fg = "#${palette.base0A}"; };
        permissions_w = { fg = "#${palette.base08}"; };
        permissions_x = { fg = "#${palette.base0B}"; };
        permissions_s = { fg = "#7f849c"; };

      };

      select = {

        border   = { fg = "#${palette.base0D}"; };
        active   = { fg = "#${palette.base06}"; bold = true; };
        inactive = {};

      };

      input = {

        border   = { fg = "#${palette.base0D}"; };
        title    = {};
        value    = {};
        selected = { reversed = true; };

      };

      completion = {

        border = { fg = "#${palette.base0D}"; };

      };

      tasks = {

        border  = { fg = "#${palette.base0D}"; };
        title   = {};
        hovered = { fg = "#${palette.base06}"; underline = true; };

      };

      which = {

        mask            = { bg = "#${palette.base02}"; };
        cand            = { fg = "#${palette.base0C}"; };
        rest            = { fg = "#9399b2"; };
        desc            = { fg = "#${palette.base06}"; };
        separator       = "  ";
        separator_style = { fg = "#${palette.base04}"; };

      };

      help = {

        on      = { fg = "#${palette.base0C}"; };
        run     = { fg = "#${palette.base06}"; };
        hovered = { reversed = true; bold = true; };
        footer  = { fg = "#${palette.base03}"; bg = "#${palette.base05}"; };


      };

      notify = {

        title_info  = { fg = "#${palette.base0B}"; };
        title_warn  = { fg = "#${palette.base0A}"; };
        title_error = { fg = "#${palette.base08}"; };

      };

      filetype = {

        rules = [

          # Images
          { mime = "image/*"; fg = "#${palette.base0C}"; }

          # Media
          { mime = "{audio,video}/*"; fg = "#${palette.base0A}"; }

          # Archives
          { mime = "application/*zip"; fg = "#${palette.base06}"; }
          { mime = "application/x-{tar,bzip*,7z-compressed,xz,rar}"; fg = "#${palette.base06}"; }

          # Documents
          { mime = "application/{pdf,doc,rtf,vnd.*}"; fg = "#${palette.base0B}"; }

          # Fallback
          { name = "*"; fg = "#${palette.base05}"; }
          { name = "*/"; fg = "#${palette.base0D}"; }
        ];

      };

      icon.rules = [
        {
          name = ".config/";
          text = "";
        }
        {
          name = ".ssh/";
          text = "󰢬";
        }
        {
          name = "Desktop/";
          text = "";
        }
        {
          name = "Programmation/";
          text = "";
        }
        {
          name = "Documents/";
          text = "";
        }
        {
          name = "Téléchargements/";
          text = "󰉍";
        }
        {
          name = "Livres/";
          text = "";
        }
        {
          name = "Films/";
          text = "";
        }
        {
          name = "Musique/";
          text = "󱍙";
        }
        {
          name = "Images/";
          text = "󰉏";
        }
        {
          name = "Vidéos/";
          text = "";
        }

        # Git
        {
          name = ".git/";
          text = "";
        }
        {
          name = ".gitignore";
          text = "";
        }
        {
          name = ".gitmodules";
          text = "";
        }
        {
          name = ".gitattributes";
          text = "";
        }

        {
          name = ".bashrc";
          text = "";
        }
        {
          name = ".bashprofile";
          text = "";
        }
        {
          name = ".zshrc";
          text = "";
        }
        {
          name = ".zshenv";
          text = "";
        }
        {
          name = ".zprofile";
          text = "";
        }
        {
          name = ".vimrc";
          text = "";
        }

        # Text
        {
          name = "*.txt";
          text = "";
        }
        {
          name = "*.md";
          text = "";
        }
        {
          name = "*.rst";
          text = "";
        }
        {
          name = "COPYING";
          text = "󰿃";
        }
        {
          name = "LICENSE";
          text = "󰿃";
        }

        # Archives
        {
          name = "*.zip";
          text = "";
        }
        {
          name = "*.tar";
          text = "";
        }
        {
          name = "*.gz";
          text = "";
        }
        {
          name = "*.7z";
          text = "";
        }
        {
          name = "*.bz2";
          text = "";
        }
        {
          name = "*.xz";
          text = "";
        }

        # Documents
        {
          name = "*.csv";
          text = "";
        }
        {
          name = "*.doc";
          text = "";
        }
        {
          name = "*.doct";
          text = "";
        }
        {
          name = "*.docx";
          text = "";
        }
        {
          name = "*.dot";
          text = "";
        }
        {
          name = "*.ods";
          text = "";
        }
        {
          name = "*.ots";
          text = "";
        }
        {
          name = "*.pdf";
          text = "";
        }
        {
          name = "*.pom";
          text = "";
        }
        {
          name = "*.pot";
          text = "";
        }
        {
          name = "*.ppm";
          text = "";
        }
        {
          name = "*.pps";
          text = "";
        }
        {
          name = "*.ppt";
          text = "";
        }
        {
          name = "*.potx";
          text = "";
        }
        {
          name = "*.ppmx";
          text = "";
        }
        {
          name = "*.ppsx";
          text = "";
        }
        {
          name = "*.pptx";
          text = "";
        }
        {
          name = "*.xlc";
          text = "";
        }
        {
          name = "*.xlm";
          text = "";
        }
        {
          name = "*.xls";
          text = "";
        }
        {
          name = "*.xlt";
          text = "";
        }
        {
          name = "*.xlsm";
          text = "";
        }
        {
          name = "*.xlsx";
          text = "";
        }

        # Audio
        {
          name = "*.mp3";
          text = "";
        }
        {
          name = "*.flac";
          text = "";
        }
        {
          name = "*.wav";
          text = "";
        }
        {
          name = "*.aac";
          text = "";
        }
        {
          name = "*.ogg";
          text = "";
        }
        {
          name = "*.m4a";
          text = "";
        }
        {
          name = "*.mp2";
          text = "";
        }

        # Movies
        {
          name = "*.mp4";
          text = "";
        }
        {
          name = "*.mkv";
          text = "";
        }
        {
          name = "*.avi";
          text = "";
        }
        {
          name = "*.mov";
          text = "";
        }
        {
          name = "*.webm";
          text = "";
        }

        # Images
        {
          name = "*.jpg";
          text = "";
        }
        {
          name = "*.jpeg";
          text = "";
        }
        {
          name = "*.png";
          text = "";
        }
        {
          name = "*.gif";
          text = "";
        }
        {
          name = "*.webp";
          text = "";
        }
        {
          name = "*.avif";
          text = "";
        }
        {
          name = "*.bmp";
          text = "";
        }
        {
          name = "*.ico";
          text = "";
        }
        {
          name = "*.svg";
          text = "";
        }
        {
          name = "*.xcf";
          text = "";
        }
        {
          name = "*.HEIC";
          text = "";
        }

        # Programming
        {
          name = "*.c";
          text = "";
        }
        {
          name = "*.cpp";
          text = "";
        }
        {
          name = "*.h";
          text = "";
        }
        {
          name = "*.hpp";
          text = "";
        }
        {
          name = "*.rs";
          text = "";
        }
        {
          name = "*.go";
          text = "";
        }
        {
          name = "*.py";
          text = "";
        }
        {
          name = "*.hs";
          text = "";
        }
        {
          name = "*.js";
          text = "";
        }
        {
          name = "*.ts";
          text = "";
        }
        {
          name = "*.tsx";
          text = "";
        }
        {
          name = "*.jsx";
          text = "";
        }
        {
          name = "*.rb";
          text = "";
        }
        {
          name = "*.php";
          text = "";
        }
        {
          name = "*.java";
          text = "";
        }
        {
          name = "*.sh";
          text = "";
        }
        {
          name = "*.fish";
          text = "";
        }
        {
          name = "*.swift";
          text = "";
        }
        {
          name = "*.vim";
          text = "";
        }
        {
          name = "*.lua";
          text = "";
        }
        {
          name = "*.html";
          text = "";
        }
        {
          name = "*.css";
          text = "";
        }
        {
          name = "*.sass";
          text = "";
        }
        {
          name = "*.scss";
          text = "";
        }
        {
          name = "*.json";
          text = "";
        }
        {
          name = "*.toml";
          text = "";
        }
        {
          name = "*.yml";
          text = "";
        }
        {
          name = "*.yaml";
          text = "";
        }
        {
          name = "*.ini";
          text = "";
        }
        {
          name = "*.conf";
          text = "";
        }
        {
          name = "*.lock";
          text = "";
        }
        {
          name = "*.nix";
          text = "";
        }
        {
          name = "Containerfile";
          text = "󰡨";
        }
        {
          name = "Dockerfile";
          text = "󰡨";
        }

        # Misc
        {
          name = "*.bin";
          text = "";
        }
        {
          name = "*.exe";
          text = "";
        }
        {
          name = "*.pkg";
          text = "";
        }

        # Default
        {
          name = "*";
          text = "";
        }
        {
          name = "*/";
          text = "󰉋";
        }
      ];

    };

  };

  

}
