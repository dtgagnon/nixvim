{
  # Fallback base16 scheme for Stylix theme
  # When Stylix is enabled via .extend in home-manager, these colors
  # will be overridden by Stylix's generated colors.
  # This provides a neutral gray scheme for standalone builds.
  stylix = {
    base00 = "#1c1c1c"; # Default Background
    base01 = "#262626"; # Lighter Background
    base02 = "#303030"; # Selection Background
    base03 = "#444444"; # Comments, Invisibles
    base04 = "#b2b2b2"; # Dark Foreground
    base05 = "#d0d0d0"; # Default Foreground
    base06 = "#e4e4e4"; # Light Foreground
    base07 = "#ffffff"; # Light Background
    base08 = "#d75f5f"; # Red
    base09 = "#ff8700"; # Orange
    base0A = "#ffd700"; # Yellow
    base0B = "#87af87"; # Green
    base0C = "#5fafaf"; # Cyan
    base0D = "#5f87af"; # Blue
    base0E = "#af87af"; # Purple
    base0F = "#d7875f"; # Brown
  };
}
