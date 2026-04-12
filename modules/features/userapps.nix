{
  self,
  inputs,
  ...
}: {
  flake.nixosModules.apps = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      btop
      fzf
      duf
      tree
      bat
      vscodium-fhs
      gearlever
      localsend
      fastfetch
    ];
  };
}
