{ pkgs, ... }:

{
  services.printing = {
    enable = true;
    drivers = with pkgs; [ hplip ];
  };

  programs.system-config-printer.enable = true;
}
