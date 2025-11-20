{ inputs, ... }:
let
  lib = inputs.nixpkgs.lib;
  colors-lib = import ./colors { inherit lib; };
  lua-lib = import ./lua { };
in
{
  inherit (colors-lib) colors;
  inherit (lua-lib) lua;
}
