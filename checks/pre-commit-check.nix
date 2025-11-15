{
  pkgs,
  inputs,
  system,
  ...
}:
inputs.pre-commit-hooks.lib.${system}.run {
  src = ./../.;
  hooks = {
    nixfmt-rfc-style = {
      enable = true;
      entry = "${pkgs.nixfmt-rfc-style}/bin/nixfmt";
      extraPackages = [ pkgs.nixfmt-rfc-style ];
    };
  };
}
