{
  lib ? (import <nixpkgs> { }).lib,
  ...
}:
let
  # Get all .nix files in this directory except default.nix
  entries = builtins.readDir ./.;
  nixFiles = lib.filterAttrs (
    name: type:
    type == "regular" && lib.hasSuffix ".nix" name && name != "default.nix"
  ) entries;
  b16Themes = map (name: ./. + "/${name}") (builtins.attrNames nixFiles);
  colors = builtins.foldl' (acc: file: acc // import file) { } b16Themes;
in
{
  inherit colors;
}
