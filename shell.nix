{ pkgs ? import <nixpkgs> {} }:
  pkgs.mkShell {
    buildInputs = [
        pkgs.adoptopenjdk-bin
        pkgs.gradle
    ];
}