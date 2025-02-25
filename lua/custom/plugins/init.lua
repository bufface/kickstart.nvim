return {
  {
    'folke/persistence.nvim',
    event = 'BufReadPre', -- this will only start session saving when an actual file was opened
    opts = {},
  },
  {
    'albenisolmos/telescope-oil.nvim',
    config = function()
      -- optionally override defaults
      local settings = require 'telescope-oil.settings'
      settings.set { hidden = false }
      -- settings.set({ no_ignore = false })
      -- settings.set({ show_preview = true })

      -- load extension
      require('telescope').load_extension 'oil'

      vim.keymap.set('n', '<leader>so', '<cmd>Telescope oil<CR>', { desc = '[S]earch Files with [O]il' })
    end,
  },
  {
    'github/copilot.vim',
    enabled = true,
    -- init = function()
    --   vim.g.copilot_filetypes = { ['*'] = false }
    -- end,
  },
  {
    'folke/snacks.nvim',
    priority = 1000,
    lazy = false,
    config = function()
      local Snacks = require 'snacks'

      Snacks.setup {
        words = { enabled = true },
      }
    end,
    keys = {
      {
        ']]',
        function()
          Snacks.words.jump(vim.v.count1)
        end,
        desc = 'Next Reference',
        mode = { 'n', 't' },
      },
      {
        '[[',
        function()
          Snacks.words.jump(-vim.v.count1)
        end,
        desc = 'Prev Reference',
        mode = { 'n', 't' },
      },
    },
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
    dependencies = 'nvim-tree/nvim-web-devicons',
    config = function()
      local bufferline = require 'bufferline'
      bufferline.setup()

      vim.api.nvim_create_user_command('Cls', function()
        bufferline.close_others()
      end, { desc = 'Close all other buffers' })
      vim.keymap.set('n', '<leader>bp', ':BufferLinePick<CR>', { desc = 'Pick buffer' })
      vim.keymap.set('n', '[b', ':BufferLineCyclePrev<CR>', { desc = 'Go to prev buffer' })
      vim.keymap.set('n', ']b', ':BufferLineCycleNext<CR>', { desc = 'Go to next buffer' })
      vim.keymap.set('n', '[B', ':BufferLineMovePrev<CR>', { desc = 'Move buffer prev' })
      vim.keymap.set('n', ']B', ':BufferLineMoveNext<CR>', { desc = 'Move buffer next' })
    end,
  },
}
