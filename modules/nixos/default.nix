# Add your reusable NixOS modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.
{
  # List your module files here
  minecraft-server = ./minecraft/default.nix;
  jellyfin = ./jellyfin.nix;
  sshfs = ./sshfs.nix;
  kdeconnect = ./kdeconnect.nix;
  # my-module = import ./my-module.nix;
}
