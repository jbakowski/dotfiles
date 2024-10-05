return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },

  {
    "nvimdev/lspsaga.nvim",
    event = "LspAttach",
    config = function()
      require("lspsaga").setup {
        hover = {
          max_width = 0.8,
          open_link = "gx",
          open_browser = "!firefox",
        },
        finder = {
          max_height = 0.5,
          min_width = 30,
          force_max_height = false,
          left_width = 0.3,
        },
      }
    end,
    dependencies = { { "nvim-tree/nvim-web-devicons" } },
  },

  {
    "nvim-neotest/nvim-nio",
  },

  {
    "nvim-telescope/telescope-dap.nvim",
  },

  {
    "rcarriga/nvim-dap-ui",
  },

  {
    "theHamsta/nvim-dap-virtual-text",
  },

  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "nvim-nio",
      "nvim-telescope/telescope-dap.nvim", -- Optional: for telescope integration
      "rcarriga/nvim-dap-ui", -- UI for DAP
      "theHamsta/nvim-dap-virtual-text", -- Display virtual text for DAP
    },
    config = function()
      -- Setup DAP UI and virtual text
      require("dapui").setup()
      require("nvim-dap-virtual-text").setup()
      require("telescope").load_extension "dap"

      require("dap").adapters.lldb = {
        type = "executable",
        command = "/usr/bin/lldb-vscode", -- Path to gdb
        name = "lldb",
      }

      require("dap").configurations.c = {
        {
          name = "Debug file",
          type = "lldb",
          request = "launch",
          program = "${workspaceFolder}/main", -- Path to the binary
          cwd = "${workspaceFolder}",
          stopAtEntry = false,
          args = {},
          timeout = 30000,
        },
      }

      -- Fix for the listeners; corrected typo from 'initalized' to 'initialized'
      require("dap").listeners.after.event_initialized["dapui_config"] = function()
        require("dapui").open()
      end

      require("dap").listeners.before.event_terminated["dapui_config"] = function()
        require("dapui").close()
      end

      require("dap").listeners.before.event_exited["dapui_config"] = function()
        require("dapui").close()
      end
    end,
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "stylua",
        "html-lsp",
        "css-lsp",
        "prettier",
        "clangd",
        "clang-format",
      },
    },
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "markdown",
        "markdown_inline",
      },
      highlight = {
        enable = true,
      },
      run = ":TSUpdate",
    },
  },
}
