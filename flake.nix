{
  description = "A flake to install development libraries";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: 
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
    in {
      devShells.${system}.default = pkgs.mkShell {
        buildInputs = with pkgs; [
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
      };
    };
}
