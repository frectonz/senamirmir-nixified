# Nix flake for [Senamirmir Fonts](https://senamirmir.com/)

Included fonts

- Senamirmir Fonts
  - [Abay Font](https://senamirmir.com/senamirmir2023/#/abay)
  - [Sadiss Font](https://senamirmir.com/senamirmir2023/#/sadiss)
  - [Lessan Font](https://senamirmir.com/senamirmir2023/#/lessan)
- [LeTewahedo Font](https://senamirmir.com/senamirmir2023/#/letewahedo)

**IMPORTANT NOTE**: This flake is subject to [LinkRot](https://en.wikipedia.org/wiki/Link_rot) since this package downloads the fonts from a zip file hosted at `https://senamirmir.com/`.

The senamirmir fonts are licensed under the **Open Font License**.

## Usage

Add the flake to your inputs

```nix
senamirmir = {
  url = "github:frectonz/senamirmir-nixified";
  inputs.nixpkgs.follows = "nixpkgs";
};
```
Then add the following to your nixos config

```nix
fonts.packages = with pkgs; [
  inputs.senamirmir.packages.${pkgs.system}.Senamirmir # abay + sadiss + lessan
  inputs.senamirmir.packages.${pkgs.system}.LeTewahedo # letewahedo
];
```
