return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup()

      vim.keymap.set('n', '<leader>ha', function()
        harpoon:list():add()
      end, { desc = 'harpoon [a]dd buffer' })
      vim.keymap.set('n', '<leader>hm', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = 'harpoon [m]enu' })
    end,
  },

  {
    'stevearc/oil.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }, -- use if prefer nvim-web-devicons
    config = function()
      local actions = require 'oil.actions'

      vim.keymap.set('n', '<leader>o', require('oil').open, { desc = 'Open parent direct[o]ry' })
      vim.keymap.set('n', '<leader>O', actions.open_cwd.callback, { desc = '[O]pen cwd folder' })

      require('oil').setup {
        keymaps = {
          ['<C-y>'] = 'actions.select',
        },
      }
    end,
  },
  {
    'akinsho/bufferline.nvim',
    version = '*',
    enabled = false,
    dependencies = 'nvim-tree/nvim-web-devicons',
    opts = {},
  },
}
