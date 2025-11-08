{ inputs, ... }: _: prev:

{
  nixd = inputs.nixd.packages.${prev.stdenv.hostPlatform.system}.nixd;
}
