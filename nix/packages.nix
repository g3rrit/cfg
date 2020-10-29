{ pkgs, ... } : {
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    wget
    konsole
    vim 
    firefox
    git
    vscode
    discord
    evince
    feh
    opam
    gcc10
    gnumake
    cmake
    m4
    pkg-config    
  ];
}


