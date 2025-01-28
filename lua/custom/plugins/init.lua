return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup {}

      harpoon:extend {
        UI_CREATE = function(cx)
          vim.keymap.set('n', '<C-v>', function()
            harpoon.ui:select_menu_item { vsplit = true }
          end, { buffer = cx.bufnr })

          vim.keymap.set('n', '<C-x>', function()
            harpoon.ui:select_menu_item { split = true }
          end, { buffer = cx.bufnr })
        end,
      }

      vim.keymap.set('n', '<leader>hm', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end, { desc = '[H]arpoon [m]enu' })
      vim.keymap.set('n', '<leader>ha', function()
        harpoon:list():add()
      end, { desc = '[H]rpoin [a]dd buffer' })
      vim.keymap.set('n', '<leader>1', function()
        harpoon:list():select(1)
      end, { desc = 'Go to harpoon buffer 1' })
      vim.keymap.set('n', '<leader>2', function()
        harpoon:list():select(2)
      end, { desc = 'Go to harpoon buffer 2' })
      vim.keymap.set('n', '<leader>3', function()
        harpoon:list():select(3)
      end, { desc = 'Go to harpoon buffer 4' })
      vim.keymap.set('n', '<leader>4', function()
        harpoon:list():select(4)
      end, { desc = 'Go to harpoon buffer 4' })

      -- Toggle previous & next buffers stored within Harpoon list
      vim.keymap.set('n', '<C-S-P>', function()
        harpoon:list():prev()
      end)
      vim.keymap.set('n', '<C-S-N>', function()
        harpoon:list():next()
      end)
    end,
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

      Snacks.toggle.option('relativenumber', { name = 'Relative Number' }):map '<leader>tr'
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
    end,
  },
}
