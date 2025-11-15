{
  description = "A custom neovim configuration using nixvim.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/master";

    nixvim.url = "github:nix-community/nixvim";

    nixd.url = "github:nix-community/nixd";

    blueprint.url = "github:numtide/blueprint";
    blueprint.inputs.nixpkgs.follows = "nixpkgs";

    pre-commit-hooks.url = "github:cachix/pre-commit-hooks.nix";
    pre-commit-hooks.inputs.nixpkgs.follows = "nixpkgs";
  };

  # TODO: a todo
  # NOTE: a note
  # WARN: a warning
  # HACK: a hack
  outputs =
    inputs:
    inputs.blueprint {
      inherit inputs;

      nixpkgs = {
        config = {
          allowBroken = true;
          allowUnfree = true;
        };
        overlays = with inputs; [ nixvim.overlays.default ];
      };
    };
}
