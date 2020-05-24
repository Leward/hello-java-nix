{ pkgs ? import <nixpkgs> { } }:
# { stdenv, jdk }:

pkgs.stdenv.mkDerivation {
  name = "hello";
  version = "latest";
  src = ./src;

  buildInputs = [
      pkgs.adoptopenjdk-bin
  ];

  # More info on the patchelf bit: https://sandervanderburg.blogspot.com/2015/10/deploying-prebuilt-binary-software-with.html
  buildPhase = ''
    javac -d "$out/mods/a" $src/module-info.java $src/eu/leward/demo/a/NaySayer.java
    jar -c --file=$out/a.jar -C $out/mods/a .
  '';
  
  installPhase = ''

  '';
}
