{ pkgs, ... }:
{
  # Claude Code plugin configuration
  extraConfigLua = ''
    -- Setup claudecode
    require('claudecode').setup({
      -- Default configuration
      -- terminal_cmd can be overridden for local installations:
      -- terminal_cmd = "~/.claude/local/claude",
    })
  '';

  keymaps = [
    # Toggle Claude Code
    {
      mode = "n";
      key = "<leader>ac";
      action = "<cmd>ClaudeCode<cr>";
      options = {
        silent = true;
        desc = "Claude: Toggle";
      };
    }
    # Focus Claude Code window
    {
      mode = "n";
      key = "<leader>af";
      action = "<cmd>ClaudeCodeFocus<cr>";
      options = {
        silent = true;
        desc = "Claude: Focus";
      };
    }
    # Resume previous session
    {
      mode = "n";
      key = "<leader>ar";
      action = "<cmd>ClaudeCode --resume<cr>";
      options = {
        silent = true;
        desc = "Claude: Resume";
      };
    }
    # Continue from last session
    {
      mode = "n";
      key = "<leader>aC";
      action = "<cmd>ClaudeCode --continue<cr>";
      options = {
        silent = true;
        desc = "Claude: Continue";
      };
    }
    # Select model
    {
      mode = "n";
      key = "<leader>am";
      action = "<cmd>ClaudeCodeSelectModel<cr>";
      options = {
        silent = true;
        desc = "Claude: Select Model";
      };
    }
    # Add current buffer to context
    {
      mode = "n";
      key = "<leader>ab";
      action = "<cmd>ClaudeCodeAdd %<cr>";
      options = {
        silent = true;
        desc = "Claude: Add Buffer";
      };
    }
    # Send selection to Claude
    {
      mode = "v";
      key = "<leader>as";
      action = "<cmd>ClaudeCodeSend<cr>";
      options = {
        silent = true;
        desc = "Claude: Send Selection";
      };
    }
    # Accept diff changes
    {
      mode = "n";
      key = "<leader>aa";
      action = "<cmd>ClaudeCodeDiffAccept<cr>";
      options = {
        silent = true;
        desc = "Claude: Accept Diff";
      };
    }
    # Deny/reject diff changes
    {
      mode = "n";
      key = "<leader>ad";
      action = "<cmd>ClaudeCodeDiffDeny<cr>";
      options = {
        silent = true;
        desc = "Claude: Deny Diff";
      };
    }
  ];
}
