{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.gaming = {pkgs, ...}: {
    programs = {
      steam = {
      enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
      ];
    };
      gamemode = {
        enable = true;
      };
      gamescope = {
        enable = true;
      };
    };
    environment.systemPackages = with pkgs; [
      goverlay
      mangohud
      heroic
    ];
  };
}
