{ pkgs
, helpers
, ...
}:
let
  thunk = body:
    helpers.mkRaw ''
      function()
        ${body}
      end
    '';
in
{
  extraPackages = with pkgs; [ nixfmt-rfc-style ];
  extraPlugins = with pkgs.vimPlugins; [ actions-preview-nvim ];

  extraConfigLua =
    "	do\n		require(\"actions-preview\").setup({\n			diff = {\n				ignore_whitespace = true,\n			},\n			highlight_command = {\n				require(\"actions-preview.highlight\").diff_highlight()\n			},\n			backend = { \"telescope\" },\n		})\n	end\n";

  extraConfigLuaPre = ''
    do
      local diagnostic_signs = { Error = "", Warn = "", Hint = "", Info = "" }
      
      -- Modern way to configure diagnostic signs
      vim.diagnostic.config({
        underline = true,
        update_in_insert = true,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = diagnostic_signs.Error,
            [vim.diagnostic.severity.WARN] = diagnostic_signs.Warn,
            [vim.diagnostic.severity.HINT] = diagnostic_signs.Hint,
            [vim.diagnostic.severity.INFO] = diagnostic_signs.Info,
          }
        }
      })
    end
  '';

  autoCmd = [{
    event = [ "BufRead" "BufNewFile" ];
    pattern = [ "*.txt" "*.md" "*.tex" "LICENSE" ];
    command = "setlocal spell";
  }];

  plugins.lsp = {
    enable = true;
    inlayHints = true;

    keymaps = {
      silent = true;

      diagnostic = {
        "<leader>j" = "goto_next";
        "<leader>k" = "goto_prev";
      };

      lspBuf = {
        K = "hover";
        gh = "hover";
        gR = "references";
        gd = "definition";
        gi = "implementation";
        gD = "type_definition";
      };

      extra = [
        {
          action = thunk "vim.cmd 'LspStop'";
          key = "<leader>lx";
          options = {
            desc = "LSP: Stop";
            silent = true;
          };
        }
        {
          action = thunk "vim.cmd 'LspStart'";
          key = "<leader>ls";
          options = {
            desc = "LSP: Start";
            silent = true;
          };
        }
        {
          action = thunk "vim.cmd 'LspRestart'";
          key = "<leader>lr";
          options = {
            desc = "LSP: Restart";
            silent = true;
          };
        }
        {
          action = helpers.mkRaw
            # lua
            ''
              require('telescope.builtin').lsp_definitions
            '';
          key = "<leader>gd";
          options = {
            desc = "LSP: Definitions";
            silent = true;
          };
        }
        {
          action = helpers.mkRaw
            # lua
            ''
              require('actions-preview').code_actions
            '';
          key = "<leader>ca";
          options = {
            desc = "LSP: Code Actions";
            silent = true;
          };
        }
      ];
    };

    servers = {
      astro.enable = true;
      clangd.enable = true;
      cmake.enable = true;
      cssls.enable = true;
      denols.enable = true;
      dockerls.enable = true;
      docker_compose_language_service.enable = true;
      eslint.enable = true;
      emmet_ls.enable = true;
      gleam.enable = true;
      # gdscript.enable = true;
      gopls.enable = true;
      graphql.enable = false;
      html.enable = true;
      jsonls.enable = true;
      ltex.enable = true;
      lua_ls.enable = true;
      nginx_language_server.enable = true;
      nixd = {
        enable = true;
        package = pkgs.nixd;
        settings = {
          nixpkgs.expr = "import <nixpkgs> { }";
          formatting.command = [ "nixpkgs-fmt" ];
          # # Capabailities for diagnosing semantic_token highlight issues on some nix files
          # options = {
          #   nixos.expr = ''
          #     let configs = (builtins.getFlake ("git+file://" + builtins.toString ./.)).nixosConfigurations; in (builtins.head (builtins.attrValues configs)).options
          #   '';
          #   home_manager.expr = ''
          #     let configs = (builtins.getFlake ("git+file://" + builtins.toString ./.)).homeConfigurations; in (builtins.head (builtins.attrValues configs)).options
          #   '';
          #   darwin.expr = ''
          #     let configs = (builtins.getFlake ("git+file://" + builtins.toString ./.)).darwinConfigurations; in (builtins.head (builtins.attrValues configs)).options
          #   '';
          # };
        };
      };
      nushell.enable = true;
      perlpls.enable = true;
      phpactor.enable = true;
      # prismals.enable = true;
      pyright.enable = true;

      ## rust-tools plugin is deprecated and project is abandoned - check that rust_analyzer is just relational to rust-tools.
      #      rust_analyzer = {
      #        enable = true;
      #        installCargo = true;
      #        installRustc = true;
      #      };

      sqls.enable = true;
      tailwindcss.enable = true;
      terraformls.enable = true;
      ts_ls.enable = true;
      volar.enable = true;
      yamlls.enable = true;
      zls.enable = true;
    };
  };
}
