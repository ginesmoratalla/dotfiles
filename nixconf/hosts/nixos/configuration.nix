# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config
, pkgs
, vars
, nixpkgs-stable
, ... 
}:
let
  stable = import nixpkgs-stable {
    system = pkgs.system;
  };
in 
{
  imports =
    [
      ./hardware-configuration.nix
      ./terminal.nix
      ./networking.nix
      ./nvidia.nix
    ];

    # Bootloader.
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    

    # Enable virtual camera (droidcam)
    boot.extraModulePackages = with config.boot.kernelPackages; [ v4l2loopback ];
    boot.kernelModules = [ "v4l2loopback" ];
    boot.kernelParams = [ "kvm.enable_virt_at_load=0" ]; # Workaround for VBox to use virtualisation
    boot.extraModprobeConfig =
    ''
    options v4l2loopback video_nr=2,3 width=640,1920 
    max_width=1920 height=480,1080 max_height=1080 format=YU12,YU12 exclusive_caps=1,1 card_label=Phone,Laptop debug=1
    '';
    nix.gc.automatic = true;
    nix.extraOptions = "experimental-features = nix-command flakes";
    nix.settings = {
      extra-substituters = [
        "https://cache.nixos.org/"
        "https://cuda-maintainers.cachix.org"
      ];
      extra-trusted-public-keys = [
        "cuda-maintainers.cachix.org-1:0dq3bujKpuEPMCX6U4WylrUDZ9JyUG0VpVZa7CNfq5E="
      ];
    };

    # Configure network proxy if necessary
    # networking.proxy.default = "http://user:password@proxy:port/";
    # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
    # Open ports in the firewall.
    # networking.firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.

    # Set your time zone.
    time.timeZone = "Europe/Madrid";

    # Select internationalisation properties.
    i18n.defaultLocale = "en_US.UTF-8";
    i18n.extraLocaleSettings = {
      LC_ADDRESS = "es_ES.UTF-8";
      LC_IDENTIFICATION = "es_ES.UTF-8";
      LC_MEASUREMENT = "es_ES.UTF-8";
      LC_MONETARY = "es_ES.UTF-8";
      LC_NAME = "es_ES.UTF-8";
      LC_NUMERIC = "es_ES.UTF-8";
      LC_PAPER = "es_ES.UTF-8";
      LC_TELEPHONE = "es_ES.UTF-8";
      LC_TIME = "es_ES.UTF-8";
    };

    # Enable the X11 windowing system.
    services.xserver.enable = true;
    services.xserver.videoDrivers = [ "virtualbox" ];

    # Enable the GNOME Desktop Environment.
    services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    virtualisation = {
      docker.enable = true;
      virtualbox.host.enable = true;
      virtualbox.guest.enable = true;
    };

    users = {
        groups.docker.members = [ "ginesmr" ];
        extraGroups.vboxusers.members = [ "ginesmr" ];
    };


    # Configure keymap in X11
    services.xserver = {
     xkb.layout = "es";
     xkb.variant = "";
    };

    services.flatpak = {
     enable = true;
    };

    # Enable CUPS to print documents.
    services.printing.enable = true;

    # Configure console keymap
    console.keyMap = "es";

    # Enable sound with pipewire.
    services.pulseaudio.enable = false;

    security.rtkit.enable = true;
     
    services.pipewire = {
     enable = true;
     alsa.enable = true;
     alsa.support32Bit = true;
     pulse.enable = true;

    };

    # Define a user account. Don't forget to set a password with ‘passwd’.
    users.users.${vars.host} = {
      isNormalUser = true;
      shell = pkgs.zsh;
      description = "ginesmr";
      extraGroups = [ "vboxusers" "networkmanager" "wheel" "docker"];
    };

    home-manager.users.${vars.host} = {
      imports = [
        ../../modules/common
      ];
      home.stateVersion = "25.05";
    };
  
    # Install firefox.
    # programs.firefox.enable = true;
  
    # Allow unfree packages
    nixpkgs.config.allowUnfree = true;

    # List packages installed in system profile. To search, run:
    # $ nix search wget
    environment.systemPackages = with pkgs; [

      bash                                        # terminal interpreter
      biome                                       # Formatter, linter, bundler, and more for JavaScript, TypeScript, JSON, HTML, Markdown, and CSS.
      btop                                        # like htop but cooler I guess
      cbonsai                                     # terminal bonsai tree
      # stable.cudatoolkit                        # self-explanatory
      dig                                         # DNSs
      discord                                     # discord
      docker                                      # containers 
      docker-compose                              # compose containers
      dpkg                                        # Pakcage Management
      droidcam                                    # phone camera connector
      fastfetch                                   # fetcher
      ffmpeg                                      # I don't know
      flatpak                                     # flatpak package manager
      stable.firefox
      fzf                                         # fuzzy find (terminal finder)
      gcc                                         # C compiler
      git                                         # Version Control
      networkmanager-openconnect
      gnumake                                     # C project manager
      go                                          # Go Programming Language
      google-chrome                               # Browser
      htop                                        # watch processes
      imagemagick                                 # Image Manipulation
      iperf3                                      # IP Pinging and Stuff
      jflap                                       # GUI for formal languages (SCC.312)
      flatpak                                     # flatpak package manager
      killall                                     # Process Killer
      kitty                                       # Terminal Emulator
      kompose                                     # Tool to Conver docker-compose into kubernetes
      kubernetes                                  # Container Orchestration
      lazygit                                     # git TUI
      libreoffice                                 # Office
      lsof                                        # List Open Files command
      lshw                                        # Node Hardware Information
      lua                                         # lua
      maven                                       # Java Pakcage Builder
      minikube                                    # Run Kubernetes Locally
      neofetch                                    # Terminal Fetch
      neovim                                      # Code Editor
      nitch                                       # Terminal Fetch
      nodejs_22                                   # node JS
      obsidian                                    # To Take Notes
      kdePackages.okular                          # Document Viewer
      openjdk11                                   # java development kit
      openvpn                                     # personal VPN
      gnome-tweaks                                # GNOME Extensions and Settings
      prismlauncher                               # minecraft launcher
      protonvpn-gui
      libsForQt5.qt5ct                            # Qt Program Configurator
      ripgrep                                     # live grep with nvim telescope
      spotify                                     # Music Client
      starship                                    # Terminal Prompt
      superfile                                   # Terminal-Based File Manager
      tmux                                        # terminal multiplexer
      traceroute                                  # Trace Packets Sent
      tree                                        # tree file visualizer
      unzip                                       # Unzipper
      uv                                          # Python package manager
      vim                                         # Text Editor
      vscode                                      # IDE / Code Editor
      wget                                        # Deliver Files through App Layer Protocol 
      wireguard-tools                             # VPN
      xclip                                       # Clippboard package
      xdg-desktop-portal                          # For Desktop Sandobxed Apps
      yazi                                        # Terminal File Manager
      zsh                                         # terminal interpreter
      checkstyle                                  # for formatting java code
      black                                       # python code formatter
      astyle                                      # Indenter and Formatter for C, C++, and Java
      ccls                                        # C / C++ Language Server
      cmatrix                                     # matrix-like terminal effect
      gopls                                       # Go language server
      htmx-lsp                                    # LSP
      jdt-language-server                         # Java Language Server
      lua-language-server                         # Language Server for Lua Vim
      nil                                         # nix language server
      zls                                         # zig language server
      stylua                                      # lua language formatter
      pyright                                     # pythong language server
      nodePackages.bash-language-server
      nodePackages.typescript
      nodePackages.typescript-language-server
     ];

     # Fonts (Nerdfonts)
     fonts = {
        fontDir.enable = true;
        fontconfig.enable = true;
        packages = with pkgs; [
          nerd-fonts.iosevka
          nerd-fonts.iosevka-term-slab
          nerd-fonts.jetbrains-mono
        ];
     };

     # Steam
     programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
     };

      # Some programs need SUID wrappers, can be configured further or are
      # started in user sessions.
      # programs.mtr.enable = true;
      # programs.gnupg.agent = {
      #   enable = true;
      #   enableSSHSupport = true;
      # };
    
      # List services that you want to enable:
    
      # Enable the OpenSSH daemon.
      services.openssh.enable = true;

      # This value determines the NixOS release from which the default
      # settings for stateful data, like file locations and database versions
      # on your system were taken. It‘s perfectly fine and recommended to leave
      # this value at the release version of the first install of this system.
      # Before changing this value read the documentation for this option
      # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
      system.stateVersion = "24.05"; # Did you read the comment?
  }
