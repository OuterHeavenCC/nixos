{ pkgs, config, ... }:

let
  cfg = config.xdg;
in
{
  home = {
    sessionVariables = {
      CARGO_HOME = "${cfg.dataHome}/cargo";
      RUSTUP_HOME= "${cfg.dataHome}/rustup";
    };
    packages = with pkgs; [
        rustup                        # Basic programming stuff
    ];
  };
}
