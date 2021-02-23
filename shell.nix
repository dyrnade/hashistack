{ pkgs ? import <nixpkgs> {} }:
let
  # lnp = pkgs.fetchgit {
  #   url = "https://github.com/NixOS/nixpkgs.git";
  #   rev = "b1efbc6aa3efbe6eab81f2f4744b57d6a71bc736";
  #   sha256 = "0ygsmmp24w14x5fm2qz2v68p59bs2ravn22axrg2ipn5skkgrvxz";
  # };
  lnp = builtins.fetchTarball { url = "https://github.com/NixOS/nixpkgs/archive/3642025e5ed26c228d832a78137da4bf71bad2ad.tar.gz"; };
  latestNixPkgs = import lnp {};
in pkgs.mkShell {
    nativeBuildInputs = [
        latestNixPkgs.terraform
        latestNixPkgs.boundary
        latestNixPkgs.waypoint
        latestNixPkgs.nomad
        latestNixPkgs.vault
    ];
    
    shellHook = ''
      export NIX_PATH=${pkgs.path}:nixpkgs=${latestNixPkgs.path}:.
    '';
}
