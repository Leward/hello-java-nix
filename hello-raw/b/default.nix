{ pkgs ? import <nixpkgs> { } }:

let 
    a = import ../a/default.nix { pkgs = pkgs; };
in 
pkgs.stdenv.mkDerivation {
    name = "hello";
    version = "latest";
    src = ./src;

    buildInputs = [
        pkgs.adoptopenjdk-bin
    ];

    buildPhase = ''
        javac \
            -d "$out/mods/b" \
            --module-path "${a.outPath}" \
            $src/module-info.java $src/eu/leward/demo/b/Main.java
        jar -c --file=$out/b.jar -C $out/mods/b .
    '';
    
    installPhase = ''

    '';
}