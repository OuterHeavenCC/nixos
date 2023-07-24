{ pkgs, ... }:
''
  set previewer ${pkgs.ctpv}/bin/ctpv
  set cleaner ${pkgs.ctpv}/bin/ctpvclear
  &${pkgs.ctpv}/bin/ctpv -s $id
  &${pkgs.ctpv}/bin/ctpvquit $id
''
