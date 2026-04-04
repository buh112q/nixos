{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.gaming = {pkgs, ...}: {
    programs.steam.enable = true;
    programs = {
      gamemode.enable = true;
      gamescope = {
        enable = true;
        # capSysNice = true;
      };
    };
    environment.systemPackages = with pkgs; [
      protonplus
      goverlay
      heroic
    ];
  };
}
