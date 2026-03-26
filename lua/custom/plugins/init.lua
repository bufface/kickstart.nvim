-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information

---@module 'lazy'
---@type LazySpec
return {
  {
    'nat-418/boole.nvim',
    enabled = false,
    config = function()
      require('boole').setup {
        mappings = {
          increment = '<C-a>',
          decrement = '<C-x>',
        },
      }
    end,
  },
  {
    'CopilotC-Nvim/CopilotChat.nvim',
    enabled = false,
    dependencies = { {
      'nvim-lua/plenary.nvim',
      branch = 'master',
    } },
    build = 'make tiktoken',
    opts = {},
  },
  {
    'github/copilot.vim',
    enabled = false,
    init = function()
      local home_dir = os.getenv 'HOME' or os.getenv 'USERPROFILE' -- Get home directory in a cross-platform way
      local node_bin_path = home_dir .. '/.nvm/versions/node/v20.20.0/bin' -- Change to your desired version
      vim.cmd("let $PATH = '" .. node_bin_path .. ":' . $PATH")
    end,
  },
  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if prefer nvim-web-devicons
    config = function()
      local actions = require 'oil.actions'

      vim.keymap.set('n', '<leader>o', require('oil').open, {
        desc = 'Open parent direct[o]ry',
      })
      vim.keymap.set('n', '<leader>O', actions.open_cwd.callback, {
        desc = '[O]pen cwd folder',
      })

      require('oil').setup {
        keymaps = {
          ['<C-y>'] = 'actions.select',
        },
      }
    end,
  },
}
