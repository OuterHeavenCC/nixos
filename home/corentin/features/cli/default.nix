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
    ./joshuto
    ./lvim.nix
    ./newsboat.nix
    ./nvim.nix
    ./zsh.nix
  ];

  home.packages = with pkgs; [
    atool                         # Archive management
    bluez                         # Bluetooth management
    bottom                        # System monitor
    calcurse                      # Calendar
    chafa                         # Image preview in terminal
    clipman                       # Clipboard management
    colordiff                     # Better diff
    ctpv                          # Terminal preview
    dconf                         # Libadwaita black theme
    direnv                        # Better dev environment management
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
    glow                          # Markdown preview in terminal
    gnome-epub-thumbnailer        # Epub thumbnailer for terminal
    gcc                           # Basic programming stuff
    gnumake                       # Basic programming stuff
    hexyl                         # Hex Viewer
    httpie                        # Better curl
    imagemagick                   # Pictures modifications
    jq                            # Json processor
    killall                       # Better pkill -15
    lazygit                       # Git made easy
    mcrcon                        # Minecraft server management
    mediainfo                     # Media metadata
    ncdu                          # Ncurses disk usage
    neofetch                      # Mandatory I use Nix btw flex
    neomutt                       # Mail
    nixpkgs-fmt                   # Format .nix files
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
    scc                           # Count lines of codes
    sd                            # Better sed
    skim                          # fzf but faster
    sqlite                        # Basic programming stuff
    texlive.combined.scheme-full  # LaTex language
    tldr                          # TLDR Man
    transmission                  # Torrents
    unrar                         # Basic archiving tool
    unzip                         # Basic archiving tool
    vimv-rs                       # Batch rename
    wget                          # Download from CLI util
    xmlstarlet                    # Preview xml in terminal
    yt-dlp                        # Better youtube-dl
    zoxide                        # Better cd
  ];

}
