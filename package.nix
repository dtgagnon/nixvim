# Blueprint creates a "default" package from package.nix at root
# This aliases it to the neovim package
{ pkgs, inputs, ... }:
(import ./packages/neovim) {
  inherit pkgs inputs;
}
