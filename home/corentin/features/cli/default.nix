{ pkgs, ... }:

{
  imports = [
    ./abook.nix
    ./android.nix
    ./bat.nix
    ./bottom.nix
    ./calcurse.nix
    ./direnv.nix
    ./git.nix
    ./gpg.nix
    ./ledger.nix
    ./lf
    ./newsboat.nix
    ./nix-index.nix
    ./taskwarrior.nix
    ./ytfzf.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    appimage-run                  # Run appimage format
    atool                         # Archive management
    bandwhich                     # Networking monitoring
    bluez                         # Bluetooth management
    bottom                        # System monitor
    calcurse                      # Calendar
    catdoc                        # .doc preview in terminal
    catdocx                       # .docx preview in terminal
    chafa                         # Terminal graphics
    cliphist                      # Clipboard management
    dconf                         # Libadwaita black theme
    delta                         # Better diff
    direnv                        # Better dev environment management
    distrobox
    dog                           # Better dig
    du-dust                       # Better du
    duf                           # Better df
    elinks                        # Terminal browser
    eva                           # Calculator
    exiftool                      # Metadata
    eza                           # Better ls
    fd                            # Better find
    ffmpeg                        # Media converter and more
    ffmpegthumbnailer             # Terminal previewer
    file                          # Determine file type
    fzf                           # Fuzzy File Finder
    gcc                           # Basic programming stuff
    glow                          # Markdown preview in terminal
    gnome-epub-thumbnailer        # Epub thumbnailer for terminal
    gnumake                       # Basic programming stuff
    hexyl                         # Hex Viewer
    hyperfine                     # Better time command
    iftop                         # Terminal ncurses network monitoring
    imagemagick                   # Pictures modifications
    jq                            # Json processor
    killall                       # Better pkill -15
    lazygit                       # Git made easy
    libcdio                       # .iso preview in terminal
    mcrcon                        # Minecraft server management
    mediainfo                     # Media metadata
    ncdu                          # Ncurses disk usage
    neofetch                      # Mandatory I use Nix btw flex
    neomutt                       # Mail
    nmap                          # Network mapping tool
    nodePackages_latest.peerflix  # Torrent streaming
    odt2txt                       # ODT file preview in terminal
    p7zip                         # Basic archiving tool
    pamixer                       # Pulseaudio command line mixer
    pciutils                      # PCI listing
    poppler_utils                 # PDF manipulations
    procs                         # Better ps
    pulsemixer                    # Ncurses Pulseaudio/Pipewire control
    python3                       # Basic programming stuff
    qemu                          # ISO Stuff
    ripgrep                       # Better grep
    scanmem                       # Runtime memory edit
    sd                            # Better sed
    silver-searcher               # A code-searching tool
    skim                          # fzf but faster
    sqlite                        # Basic programming stuff
    tealdeer                      # TLDR Man
    tokei                         # Count lines of codes
    transmission                  # Torrents
    unrar                         # Basic archiving tool
    unzip                         # Basic archiving tool
    vimv-rs                       # Batch rename
    wget                          # Download from CLI util
    xh                            # Better curl
    xmlstarlet                    # Preview xml in terminal
    xxd                           # Hex Viewer
    ydotool                       # Generic Linux command-line automation tool
    yt-dlp                        # Better youtube-dl
    wtype
    zoxide                        # Better cd
  ];

}
