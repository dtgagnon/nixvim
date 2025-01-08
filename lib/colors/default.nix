{
  lib,
  ...
}:
let
  b16Themes = lib.snowfall.fs.get-non-default-nix-files ./.;
  colors = builtins.foldl' (acc: file: acc // import file) {} b16Themes;
in
{
  inherit colors;
}
