# Add your reusable NixOS modules to this directory, on their own file (https://nixos.wiki/wiki/Module).
# These should be stuff you would like to share with others, not your personal configurations.

{
  # List your module files here
  minecraft-server = ./minecraft-server.nix;
  jellyfin = ./jellyfin.nix;
  sshfs = ./sshfs.nix;
  # my-module = import ./my-module.nix;
}
