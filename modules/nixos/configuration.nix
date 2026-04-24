{
  self,
  inputs,
  ...
}: {
  flake.nixosConfigurations.nixos = inputs.nixpkgs.lib.nixosSystem {
    modules = with self.nixosModules; [
      nixosHardware
      nixosModule
      flatpak
      fonts
      gaming
      # niri-dms
      niri-noctalia
      ssh
      apps
    ];
  };
  flake.nixosModules.nixosModule = {pkgs, ...}: {
    boot = {
      loader ={
        timeout = 0;
        systemd-boot.enable = true;
        efi.canTouchEfiVariables = true;
      };
      kernelPackages = pkgs.linuxPackages_zen;
      kernelModules = [
        "ntsync"
      ];
      kernelParams = [
        "quiet"
        "splash"
      ];
    };
    networking = {
      hostName = "nixos";
      networkmanager.enable = true;
      firewall.enable = false;
    };
    time.timeZone = "Asia/Bangkok";
    i18n.defaultLocale = "en_US.UTF-8";
    zramSwap.enable = true;
    hardware = {
      graphics.enable = true;
      graphics.enable32Bit = true;
      i2c.enable = true;
      bluetooth.enable = true;
    };
    services = {
      power-profiles-daemon.enable = true;
      upower.enable = true;
    };
    programs.appimage = {
      binfmt = true;
      enable = true;
    };
    services.pulseaudio.enable = false;
    security.rtkit.enable = true;
    services.pipewire = {
      enable = true;
      pulse.enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      wireplumber.enable = true;
    };
    programs.nix-index.enable = true;
    programs.nh = {
      enable = true;
      clean = {
        enable = true;
        extraArgs = "--keep 5 --keep-since 3d";
      };
    };
    programs.git = {
      enable = true;
      config = {
        user = {
          name = "buh112q";
          email = "lnwpoom.zaa123@gmail.com";
        };
      };
    };
    programs.fish = {
      enable = true;
      useBabelfish = true;
    };
    users.users.sock = {
      shell = pkgs.fish;
      isNormalUser = true;
      extraGroups = [
        "wheel"
        "networkmanager"
        "gamemode"
      ];
      packages = with pkgs; [];
    };
    environment.systemPackages = with pkgs; [
      alejandra
      nixd
      micro
      comma
    ];
    nixpkgs.config.allowUnfree = true;
    system.stateVersion = "25.11";
    nix.settings.experimental-features = ["nix-command" "flakes"];
  };
}
