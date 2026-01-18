{ pkgs ? import <nixpkgs> {} }:

pkgs.mkShell {
    packages = [
        (python3.withPackages(pypkgs: with pypkgs; [
            numpy
            pandas
            matplotlib
            scipy
            pywavelets
        ]))
    ];
}
