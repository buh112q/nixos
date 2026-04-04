{
  self,
  inputs,
  ...
}: {
  # This is your module that imports and configures home-manager
  flake.nixosModules.homeManager = {
    imports = [
      inputs.home-manager.nixosModules.default # import official home-manager NixOS module
    ];
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "backup";
      users.sock = {pkgs, ...}: {
        home.username = "sock";
        home.homeDirectory = "/home/sock";

        imports = [
          self.homeModules.foot
        ];

        programs.zsh = {
          enable = true;
          enableCompletion = true;
          autosuggestion.enable = true;
          syntaxHighlighting.enable = true;
          shellAliases = {};

          history.size = 10000;
          history.ignoreAllDups = true;
          history.ignorePatterns = [
            "rm *"
            "pkill *"
            "cp *"
          ];
          oh-my-zsh = {
            enable = true;
            plugins = [
              "git"
              "sudo"
            ];
            theme = "agnoster";
          };
        };
        programs.git = {
          enable = true;
          settings.user = {
            name = "buh112q";
            email = "lnwpoom.zaa123@gmail.com";
          };
        };
        home.packages = with pkgs; [
          btop
          tree
          bat
          duf
          fzf
          ripgrep
          fastfetch
        ];
        home.file = {};
        home.sessionVariables = {
          QS_ICON_THEME = "Papirus-Dark";
          EDITOR = "micro";
        };
        home.stateVersion = "25.11";
        programs.home-manager.enable = true;
      };
    };
  };
}
