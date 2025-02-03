{
  description = "A flake to install development libraries";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      packages = with pkgs; [
        mupdf.dev
        harfbuzz.dev
        freetype.dev
        jbig2dec
        libjpeg.dev
        openjpeg.dev
        gumbo
        mujs
        zlib.dev
        zig
      ];
    in {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = packages;
      };

      # Expose package versions as an output
      # nix eval .#packageVersions --json | jq
      packageVersions = builtins.listToAttrs (map (pkg: {
        name = pkg.pname or pkg.name;
        value = pkg.version;
      }) packages);
    };
}
