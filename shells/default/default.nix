{
  mkShell,
  stdenv,
  inputs,
  ...
}:
mkShell { inherit (inputs.self.checks.${stdenv.hostPlatform.system}.pre-commit-check) shellHook; }
