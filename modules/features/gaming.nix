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
    environment.sessionVariables = {
      # Set maximum cache size (e.g., 4G, 10G, or 'unlimited')
      MESA_SHADER_CACHE_MAX_SIZE = "12G";
    };
    
  };
}
