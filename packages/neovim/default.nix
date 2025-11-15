{
  pkgs,
  inputs,
  neovim-settings ? { },
  neovim-config ? { },
  ...
}:
let
  lib = pkgs.lib;
  # Recursively find all .nix files in a directory
  findNixFiles =
    dir:
    let
      entries = builtins.readDir dir;
      processEntry =
        name: type:
        let
          path = dir + "/${name}";
        in
        if type == "regular" && lib.hasSuffix ".nix" name then
          [ path ]
        else if type == "directory" then
          findNixFiles path
        else
          [ ];
    in
    lib.flatten (lib.mapAttrsToList processEntry entries);

  # Import the flake's custom lib first
  flakeLib = import ../../lib { inherit lib; };

  # Get all plugin module files
  raw-modules = findNixFiles ../../plugins;

  wrapped-modules = builtins.map (
    raw-module:
    args@{ ... }:
    let
      module = import raw-module;
      result =
        if builtins.isFunction module then
          module (
            args
            // {
              # NOTE: nixvim doesn't allow for these to be customized so we must work around the module system here...
              inherit lib pkgs;
              inherit (flakeLib) colors;
            }
          )
        else
          module;
    in
    result // { _file = raw-module; }
  ) raw-modules;

  raw-neovim = pkgs.nixvim.makeNixvimWithModule {
    inherit pkgs;

    module = {
      imports = wrapped-modules;
      config = lib.mkMerge [
        {
          _module.args = {
            settings = neovim-settings;
            lib = lib.mkForce lib;
          };
        }

        neovim-config
      ];
    };
  };

  neovim = raw-neovim.overrideAttrs (attrs: {
    meta = attrs.meta // {
      # NOTE: The default platforms specified aren't actually all supported by nixvim. Instead, only support the ones that can build with the module system.
      platforms = builtins.attrNames inputs.nixvim.legacyPackages;
    };
  });
in
neovim
