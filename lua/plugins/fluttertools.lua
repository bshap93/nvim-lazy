return {
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim", -- optional for vim.ui.select
      "RobertBrunhage/flutter-riverpod-snippets",
    },
    opts = function()
      return {
        branch = "main",
        config = function()
          require("flutter-tools").setup({
            experimental = {
              lsp_derive_paths = true,
            },
            debugger = {
              enabled = true,
              run_via_dap = false,
              exception_breakpoints = {},
              open_cmd = "10new",
            },
            outline = {
              auto_open = false,
            },
            decorations = {
              statusline = {
                app_version = true,
                device = true,
              },
            },
            widget_guides = {
              enabled = true,
              debug = false,
            },
            closing_tags = {
              highlight = "ErrorMsg",
            },
            dev_log = {
              enabled = true,
              open_cmd = "tabedit",
            },
            lsp = {
              color = {
                enabled = true,
                background = true,
                virtual_text = false,
              },
              settings = {
                showTodos = false,
                renameFilesWithClasses = "always",
                completeFunctionCalls = true,
                completeFunctionCallsAddArguments = true,
              },
            },
          })
        end,
      }
    end,
    config = true,
  },
}
