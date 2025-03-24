{ inputs, ... }: _: prev:

{
  nixd = inputs.nixd.packages.${prev.system}.nixd;
}
