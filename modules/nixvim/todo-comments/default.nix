{ 
  lib,
  config,
  ...
}:
let
  inherit (lib.spirenix-nvim) colors;
  theme = colors.${config.themeName};
in
{
  plugins.todo-comments = {
    enable = true;
    settings = {
      signs = true;
      highlight = {
        multiline = false;
        pattern = ".*<(KEYWORDS)\\s*:";
        before = "fg";
      };

      search = { pattern = "\\b(KEYWORDS):"; };

      mergeKeywords = true;

      keywords = {
        FIX = {
          icon = " ";
          color = "error";
          alt = [ "FIXME" "BUG" "FIXIT" "ISSUE" ];
        };
        TODO = {
          icon = " ";
          color = "todo";
        };
        HACK = {
          icon = " ";
          color = "error";
          alt = [ "HACK" "DRAGONS" ];
        };
        WARN = {
          icon = " ";
          color = "warning";
          alt = [ "WARNING" "WARNING" "WARN" ];
        };
        PERF = {
          icon = " ";
          color = "info";
          alt = [ "OPTIM" "PERFORMANCE" "OPTIMIZE" "PERF" "PERFORMANCE" ];
        };
        NOTE = {
          icon = " ";
          color = "hint";
          alt = [ "INFO" "NOTE" "INFO" ];
        };
      };

      colors = with theme; {
        error = [ base01 ];
        warning = [ base0C ];
        info = [ base0F ];
        hint = [ base0A ];
        todo = [ base06 ];
        default = [ base06 ];
      };
    };
  };
}
