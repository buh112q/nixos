{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.gaming = {pkgs, ...}: {
    programs.steam = {
      enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
    programs = {
      gamemode.enable = true;
      gamescope = {
        enable = true;
        # capSysNice = true;
      };
    };
    environment.systemPackages = with pkgs; [
      goverlay
      heroic
    ];
  };
}
