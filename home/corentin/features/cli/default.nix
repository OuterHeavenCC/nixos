{ pkgs, ... }:

{
  imports = [
    ./abook.nix
    ./bat.nix
    ./bottom.nix
    ./calcurse.nix
    ./direnv.nix
    ./git.nix
    ./gpg.nix
    ./ledger.nix
    ./lf
    ./lvim.nix
    ./newsboat.nix
    ./nvim.nix
    ./taskwarrior.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    atool                         # Archive management
    bandwhich                     # Networking monitoring
    bluez                         # Bluetooth management
    bottom                        # System monitor
    calcurse                      # Calendar
    chafa                         # Image preview in terminal
    clipman                       # Clipboard management
    ctpv                          # Terminal preview
    dconf                         # Libadwaita black theme
    delta                         # Better diff
    direnv                        # Better dev environment management
    dog                           # Better dig
    du-dust                       # Better du
    duf                           # Better df
    elinks                        # Terminal browser
    eva                           # Calculator
    exa                           # Better ls
    exiftool                      # Metadata
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
    imagemagick                   # Pictures modifications
    jq                            # Json processor
    killall                       # Better pkill -15
    lazygit                       # Git made easy
    mcrcon                        # Minecraft server management
    mediainfo                     # Media metadata
    ncdu                          # Ncurses disk usage
    neofetch                      # Mandatory I use Nix btw flex
    neomutt                       # Mail
    nmap                          # Network mapping tool
    nodePackages_latest.peerflix  # Torrent streaming
    nodejs                        # Basic programming stuff
    odt2txt                       # ODT file preview in terminal
    p7zip                         # Basic archiving tool
    pamixer                       # Pulseaudio command line mixer
    pandoc                        # Markdown to HTML/PDF
    pciutils                      # PCI listing
    poetry                        # Python depenency and packaging tool
    poppler_utils                 # PDF manipulations
    procs                         # Better ps
    pulsemixer                    # Ncurses Pulseaudio/Pipewire control
    python3                       # Basic programming stuff
    qemu                          # ISO Stuff
    ripgrep                       # Better grep
    ripgrep-all                   # Grep for pdf
    rustup                        # Basic programming stuff
    sc-im                         # Simple terminal spreadsheets editor
    scanmem                       # Runtime memory edit
    sd                            # Better sed
    skim                          # fzf but faster
    sqlite                        # Basic programming stuff
    tealdeer                      # TLDR Man
    texlive.combined.scheme-full  # LaTex language
    tokei                         # Count lines of codes
    timewarrior                   # Commandline time tracking and reporting tool
    transmission                  # Torrents
    unrar                         # Basic archiving tool
    unzip                         # Basic archiving tool
    vimv-rs                       # Batch rename
    ueberzugpp                    # Ueberzug replacement for wayland
    wget                          # Download from CLI util
    xh                            # Better curl
    xmlstarlet                    # Preview xml in terminal
    yt-dlp                        # Better youtube-dl
    zoxide                        # Better cd
  ];

}
