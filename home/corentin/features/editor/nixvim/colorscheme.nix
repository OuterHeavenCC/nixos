{ config, pkgs, ... }:

let
  commonIntegrations = {
    cmp = true;
    gitsigns = true;
    nvimtree = true;
    treesitter = true;
  };

  gruvboxSettings = {
    gruvbox_contrast = "hard";
    integrations = commonIntegrations;
  };
  catppuccinSettings = {
    flavour = "mocha";
    integrations = commonIntegrations;
  };
  nordSettings = {
    integrations = commonIntegrations;
  };

  rosePineSettings = {
    dark_variant = "main";
    integrations = commonIntegrations;
  };

  everforrestSettings = {
    background = "hard";
    integrations = commonIntegrations;
  };

  colorscheme = config.stylix.base16Scheme;
in
{

  # TODO Vérifier quand base16 intégrera treesitter
  programs.nixvim.colorschemes =
    if (colorscheme == "${pkgs.base16-schemes}/share/themes/gruvbox-dark-hard.yaml") then
      {
        gruvbox = {
          enable = true;
          settings = gruvboxSettings;
        };
      }
    else if (colorscheme == "${pkgs.base16-schemes}/share/themes/catppuccin-mocha.yaml") then
      {
        catppuccin = {
          enable = true;
          settings = catppuccinSettings;
        };
      }
    else if (colorscheme == "${pkgs.base16-schemes}/share/themes/nord.yaml") then
      {
        nord = {
          enable = true;
          settings = nordSettings;
        };
      }
    else if (colorscheme == "${pkgs.base16-schemes}/share/themes/everforest.yaml") then
      {
        nord = {
          enable = true;
          settings = nordSettings;
        };
      }
    else
      {
        rose-pine = {
          enable = true;
          settings = rosePineSettings;
        };
      };
}
