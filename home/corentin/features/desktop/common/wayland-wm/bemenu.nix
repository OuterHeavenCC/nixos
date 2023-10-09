{ config, ... }:
let
  inherit (config.colorscheme) colors;
in
{
  home.sessionVariables.BEMENU_OPTS="--fb '#${colors.base00}' \
  --ff '#${colors.base05}' \
  --nb '#${colors.base00}' \
  --nf '#${colors.base05}' \
  --tb '#${colors.base00}' \
  --hb '#${colors.base00}' \
  --tf '#${colors.base08}' \
  --hf '#${colors.base0A}' \
  --nf '#${colors.base05}' \
  --af '#${colors.base05}' \
  --ab '#${colors.base00}' \
  -W 0.5 \
  -B 2 \
  -R 4 \
  --bdr '#${colors.base07}' \
  -i \
  -l 10 \
  -c";
}
