{ config, pkgs, ... }:

{

   programs.zsh = {
  enable = true;
  enableCompletion = true;
  enableAutosuggestions = true;
  syntaxHighlighting.enable = true;

  shellAliases = {
    ll = "ls -l";
    update = "sudo nixos-rebuild switch --flake ~/nixos/#main";
    nvx = "nix run ~/nixos/modules/home-manager/nixvim";
    ncb = " sudo nix-collect-garbage --delete-old && sudo /run/current-system/bin/switch-to-configuration boot";
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
