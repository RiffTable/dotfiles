local servers = {
  "html",
  "cssls",
  "tailwindcss",
  "lua_ls",
  "clangd",
  "basedpyright",
  "pylsp"
}

return {
  {
    "williamboman/mason.nvim",    -- Package Manager for LSP, Prettier, Linter, DAP
    lazy = false,
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",    -- Installs packages not available in Mason
    },
    config = function()
      -- import and enable mason and configure icons
      require("mason").setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      -- import mason-lspconfig
      require("mason-lspconfig").setup({
        -- list of servers for mason to install
        ensure_installed = servers,
        automatic_enable = true,    -- run vim.lsp.enable() on installed servers
      })

      require("mason-tool-installer").setup({
        ensure_installed = {
          -- "prettier", -- prettier formatter
          -- "stylua", -- lua formatter
          -- "isort", -- python formatter
          -- "black", -- python formatter
          -- "pylint", -- python linter
          -- "eslint_d", -- js linter
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      'saghen/blink.cmp',
    },

    config = function()
      -- map('n', '<leader>dd', vim.diagnostic.enable(not vim.diagnostic.is_enabled()), {})

      local capabilities = require('blink.cmp').get_lsp_capabilities()
      local mason_lspconfig = require("mason-lspconfig")
      local lspconfig = require("lspconfig")
      -- if not ok then return end

      local iservers = mason_lspconfig.get_installed_servers()

      for _, server in ipairs(iservers) do
        if vim.lsp.config[server] then
          vim.lsp.config[server] = {
            capabilities = capabilities
          }
        end
      end


      -- Configuring one LSP at a time
      -- Use vim.lsp.config instead of lspconfig 
      vim.lsp.config.lua_ls = {
        settings = {
          Lua = {
            runtime = {
              version = "LuaJIT",
            },
            workspace = {
              checkThirdParty = false,
              library = { vim.env.VIMRUNTIME },
            },
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      }
      vim.lsp.config.basedpyright = {
        settings = {
          basedpyright = {
            analysis = {
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
              typeCheckingMode = "basic", -- "standard" or "strict" if you want to be fancy
            },
          },
        },
      }
      vim.lsp.config.pylsp = {
        settings = {
          pylsp = {
            plugins = {
              -- Disable these because Basedpyright or Ruff does them better
              pyflakes = { enabled = false },
              pycodestyle = { enabled = false },
              mccabe = { enabled = false },
              pydocstyle = { enabled = false },
              -- Keep these if you want
              jedi_completion = { enabled = true },
              jedi_definition = { enabled = true },
            },
          },
        },
      }

      vim.diagnostic.config({
        -- virtual_text = true,  -- inline messages
        virtual_text = { severity = vim.diagnostic.severity.ERROR },
        signs = { severity = vim.diagnostic.severity.ERROR },
        float = { severity = vim.diagnostic.severity.ERROR },

        underline = false,     -- squiggles
        update_in_insert = false,
      })


      -- local lspconfig = require("lspconfig")
      -- vim.lsp.config["lua_ls"] = { capabilities = capabilities, }
      -- vim.lsp.config["clangd"] = { capabilities = capabilities, }
      -- vim.lsp.config["pyright"] = { capabilities = capabilities, }

      -- Global Keybinds
      -- nada

      vim.api.nvim_create_user_command("LspStatus", function()
        -- local active_clients = vim.lsp.get_active_clients()
        local active_clients = vim.lsp.get_clients()
        if next(active_clients) then
          print("LSP servers running:")
          for _, client in pairs(active_clients) do
            print("  - " .. client.name)
          end
        else
          print("No LSP server is running.")
        end
      end, {})

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          local function map(mode, lhs, rhs, opts)
            opts = opts or {}
            opts.noremap = opts.noremap == nil and true or opts.noremap
            opts.buffer = opts.buffer == nil and ev.buf or opts.buffer

            vim.keymap.set(mode, lhs, rhs, opts)
          end

          -- Buffer Local Mapping
          map('n', 'gd', vim.lsp.buf.definition, { desc = 'Go to definition' })
          map('n', 'gD', vim.lsp.buf.declaration, { desc = 'Go to declaraction' })
          map('n', 'gi', vim.lsp.buf.implementation, { desc = 'Go to implementation' })
          map('n', '<leader>r', vim.lsp.buf.rename, { desc = 'LSP Rename' })
          -- map('n', '<F2>', vim.lsp.buf.rename, { desc = 'LSP Rename' })
          map('n', '_', vim.lsp.buf.hover, {})
          map({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
        end
      })
    end,
  }
}
