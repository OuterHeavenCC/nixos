# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ pkgs, inputs, ... }:

{
  imports =
    [ 

      inputs.hardware.nixosModules.common-cpu-intel

      ../common/global/git.nix
      ../common/global/locale.nix
      ../common/global/locate.nix
      ../common/global/nix.nix
      ../common/global/security.nix
      ../common/global/shell.nix
      ../common/global/ssh.nix

      ../common/optional/android.nix
      ../common/optional/bluetooth.nix
      ../common/optional/fail2ban.nix
      ../common/optional/flatpak.nix
      ../common/optional/kdeconnect.nix
      ../common/optional/pipewire.nix
      ../common/optional/printer.nix
      ../common/optional/systemd-boot.nix
      ../common/optional/upower.nix
      
      ../common/users/jade

      ./hardware-configuration.nix

    ];

  networking  = {
    hostName = "harmonie";
    nameservers = [ "1.1.1.1" "1.0.0.1" ];
  };

  networkmanager = {
    enable = true;
    dns = "none";
    unmanaged = [ "rc-manager" ];
  };

  # Enable the X11 windowing system.
  services.xserver = {
    enable = true;
    videoDrivers = ["nvidia"];
  };

  hardware = {
    opengl = {
      enable = true;
      driSupport32Bit = true;
      extraPackages = with pkgs; [
        vaapiVdpau
        libvdpau-va-gl
        nvidia-vaapi-driver
        ocl-icd
      ];
    };
    nvidia = {
      modesetting.enable = true;
      powerManagement.enable = false;
      powerManagement.finegrained = false;
    };
  };

  # Enable the KDE Plasma Desktop Environment.
  services.xserver.displayManager.sddm.wayland.enable = true;
  services.xserver.desktopManager.plasma6.enable = true;

  # Configure keymap in X11
  services.xserver = {
    layout = "fr";
    xkbVariant = "";
  };

  # Configure console keymap
  console.keyMap = "fr";

  users.users.jade = {
    isNormalUser = true;
    description = "jade";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
      bottles
      duf
      eza
      fd
      firefox
      gimp
      hunspell
      hunspellDicts.en-us
      hunspellDicts.fr-reforme1990
      kate
      psst
      keepassxc
      killall
      libreoffice-qt
      mpv
      neovim
      prismlauncher
      ripgrep
      scanmem
      telegram-desktop
      thunderbird
      unrar
      unzip
      warp
      wget
      yt-dlp
      zafiro-icons
      zathura
    ];
  };


  programs.neovim = {
    enable = true;
    viAlias = true;
    vimAlias = true;
  };

  # Enable automatic login for the user.
  services.xserver.displayManager.autoLogin.enable = true;
  services.xserver.displayManager.autoLogin.user = "jade";

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
   programs.mtr.enable = true;
   programs.gnupg.agent = {
     enable = true;
     enableSSHSupport = true;
   };

  # List services that you want to enable:

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "23.11"; # Did you read the comment?

}
