{ config, pkgs, ... }:

{
  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "olivier";
  home.homeDirectory = "/home/olivier";

  home.stateVersion = "23.11"; 
  
  imports = [
     ../../modules/home-manager/tmux.nix
     ../../modules/home-manager/zsh.nix
  ];

  home.packages = with pkgs; [
  nerdfonts
  neovim
  libreoffice

  libstdcxx5
  lazygit

  neofetch
  
  gh

  alacritty


  unzip

  black 

  go
  python3
  rustc
  nodejs
  gcc
  cmake


  fzf
  fd
  ripgrep

  
  cargo
  
  ];

  home.file = {
  # Empty
  };

  home.sessionVariables = {
  #  EDITOR = "nvim";
  };

  programs.git =
{
    enable = true;
    userEmail = "oliviertremblay13@gmail.com";
    userName = "1321tremblay";
    aliases =
    {
        s = "status";
        l = "log";
    };
    ignores = [ "*.swp" "*.log" "*.pdf" "*.aux" "*.out" ];
};
  
  programs.home-manager.enable = true;
  
 

  
}
  
