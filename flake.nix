{
  description = "Senamirmir fonts packaged as a nix flake";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    fu.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, fu }:
    fu.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs { inherit system; };
      in
      with pkgs;
      {
        formatter = nixpkgs-fmt;

        packages.default = pkgs.stdenvNoCC.mkDerivation rec {
          name = "senamirmir";
          version = "5.1";

          dontConfigure = true;

          src = pkgs.fetchzip {
            url = "https://senamirmir.com/senamirmir2023/assets/dist/SenamirmirFonts-${version}.zip";
            sha256 = "sha256-6A4M/+XK9mewRXTPejTaSXCyDonk3MGrY9Uin3vHT5o=";
            stripRoot = false;
          };

          installPhase = ''
            mkdir -p $out/share/fonts/truetype/
            cp $src/*.ttf $out/share/fonts/truetype/
          '';

          meta = { description = "The senamirmir fonts collection"; };
        };
      }
    );
}
