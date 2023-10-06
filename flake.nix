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

        Senamirmir = pkgs.stdenvNoCC.mkDerivation rec {
          pname = "senamirmir";
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

        LeTewahedo = pkgs.stdenvNoCC.mkDerivation rec {
          pname = "LeTewahedo";
          version = "1.0";

          dontConfigure = true;

          src = pkgs.fetchzip {
            url = "https://senamirmir.com/senamirmir2023/assets/dist/SenamirmirLeTewahedo-${version}.zip";
            sha256 = "sha256-xMiwznDRJzU470Q3P6VBScrEfi9kC/U2p5csakJAnEc=";
            stripRoot = false;
          };

          installPhase = ''
            mkdir -p $out/share/fonts/truetype/
            cp $src/ttf/*.ttf $out/share/fonts/truetype/
          '';

          meta = { description = "The senamirmir fonts collection"; };
        };
      in
      with pkgs;
      {
        formatter = nixpkgs-fmt;

        packages = { inherit LeTewahedo Senamirmir; };
      }
    );
}
