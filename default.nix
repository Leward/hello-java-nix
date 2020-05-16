{ pkgs ? import <nixpkgs> { } }:

let hello = pkgs.stdenv.mkDerivation {
  name = "hello";
  version = "latest";
  src = ./src;

  buildInputs = [
      pkgs.adoptopenjdk-bin
      pkgs.zlib
  ];

  # More info on the patchelf bit: https://sandervanderburg.blogspot.com/2015/10/deploying-prebuilt-binary-software-with.html
  buildPhase = ''
    javac -d "$out/mods/hello" $src/hello/module-info.java $src/hello/hello/Hello.java
  '';
  
  installPhase = ''

  '';

};
in 
pkgs.writeShellScript "hello.sh" ''
    ${pkgs.adoptopenjdk-bin}/bin/java --module-path ${hello.outPath}/mods -m hello/hello.Hello
''