{ lib, nvimTheme, ... }: {
  plugins.todo-comments = {
    enable = true;

    settings = {
      signs = true;

      highlight = {
        multiline = true;
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

      colors = with lib.spirenix.theme.${nvimTheme}; {
        error = [ theme.${nvimTheme} 1 ];
        warning = [ theme.${nvimTheme} 12 ];
        info = [ theme.${nvimTheme} 15 ];
        hint = [ theme.${nvimTheme} 10 ];
        todo = [ theme.${nvimTheme} 6 ];
        default = [ theme.${nvimTheme} 6 ];
      };
    };
  };
}
