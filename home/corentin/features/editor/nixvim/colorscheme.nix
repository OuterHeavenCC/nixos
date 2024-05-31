{ config, ... }:

let
colorscheme = config.colorscheme.slug;
in
{
  programs.nixvim.colorschemes =
    if (colorscheme == "gruvbox-dark-hard") then {
      gruvbox = {
        enable = true;
        settings = {
          gruvbox_contrast = "hard";
          integrations = {
            cmp = true;
            gitsigns = true;
            nvimtree = true;
            treesitter = true;
          };
        };
      };
    } else if (colorscheme == "catppuccin-mocha") then {
      catppuccin = {
        enable = true;
        settings = {
          flavour = "mocha";
          integrations = {
            cmp = true;
            gitsigns = true;
            nvimtree = true;
            treesitter = true;
          };
        };
      };
    } else if (colorscheme == "nord") then {
      nord = {
        enable = true;
        settings = {
          integrations =  {
            cmp = true;
            gitsigns = true;
            nvimtree = true;
            treesitter = true;
          };
        };
      };
    } else {
      rose-pine = {
        enable = true;
        settings = {
          dark_variant = "main";
          integrations = {
            cmp = true;
            gitsigns = true;
            nvimtree = true;
            treesitter = true;
          };
        };
      };
    };
}
