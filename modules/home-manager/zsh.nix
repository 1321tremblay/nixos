{ config, pkgs, ... }:

{

   programs.zsh = {
  enable = true;
  enableCompletion = true;
  enableAutosuggestions = true;
  syntaxHighlighting.enable = true;

  shellAliases = {
    ll = "ls -l";
    update = "sudo nixos-rebuild switch";
    nvx = "nix run ~/nixos/modules/home-manager/nixvim";
  };
  history.size = 10000;
  history.path = "${config.xdg.dataHome}/zsh/history";

    oh-my-zsh = {
    enable = true;
    plugins = [ "git" ];
    theme = "robbyrussell";
  };
   };
  home.packages = with pkgs; [
    zsh
    # Add any additional packages needed by your Zsh configuration (e.g., for plugins)
  ];

  }
