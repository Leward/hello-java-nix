{ pkgs ? import <nixpkgs> { } }:

let 
    a = import a/default.nix { pkgs = pkgs; };
    b = import b/default.nix { pkgs = pkgs; };
in 
pkgs.writeShellScript "hello.sh" ''
    ${pkgs.adoptopenjdk-bin}/bin/java \
      --module-path "${a.outPath}:${b.outPath}" -m b/eu.leward.demo.b.Main
''