{ config, ... }:

let 
  inherit (config.colorscheme) colors;
in
{
  
  home.sessionVariables.TERMINAL = "foot";

  programs.foot = {
    enable = true;
    settings = {
      mouse = {
        hide-when-typing = "yes";
      };
      colors = {
        alpha = 0.7;
        foreground = "${colors.base05}";
        background= "${colors.base00}";
        regular0 = "${colors.base03}";   
        regular1 = "${colors.base08}";   
        regular2= "${colors.base0B}";
        regular3 = "${colors.base0A}";   
        regular4 = "${colors.base0D}";   
        regular5= "${colors.base06}";
        regular6 = "${colors.base0C}";   
        regular7 = "${colors.base07}";   
        bright0= "${colors.base04}";
        bright1 = "${colors.base08}";    
        bright2 = "${colors.base0B}";    
        bright3= "${colors.base0A}";
        bright4 = "${colors.base0D}";    
        bright5 = "${colors.base06}";    
        bright6= "${colors.base0C}";
        bright7 = "${colors.base0E}";    
      }; 
    };
  };
} 
