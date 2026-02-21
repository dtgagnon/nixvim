{
  mkShell,
  pkgs,
  inputs,
  system,
  ...
}:
mkShell {
  inherit (inputs.self.checks.${system}.pre-commit-check) shellHook;
}
