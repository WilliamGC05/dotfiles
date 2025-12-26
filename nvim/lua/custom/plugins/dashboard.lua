-- ~/.config/nvim/lua/plugins/dashboard.lua
-- Dashboard: a start screen for Neovim
-- Repo: https://github.com/nvimdev/dashboard-nvim
--
-- Notes:
--   - Loads on startup (VimEnter) and shows a customizable home screen
--   - Sections: header (ASCII art), center (menu items), footer (status/info)
--   - Requires a Nerd Font for icons to render properly
--   - You can freely change icons, descriptions, and actions below

return {
  {
    'nvimdev/dashboard-nvim',
    event = 'VimEnter', -- load only when entering Neovim
    dependencies = {
      'nvim-tree/nvim-web-devicons', -- optional, but recommended for icons
    },
    config = function()
      -- If you use 'telescope.nvim', these actions will Just Work™
      -- (They can be replaced with anything: commands, lua functions, etc.)
      local db = require 'dashboard'

      -- === Custom Header Highlight ===============================================
      -- Keeps header color consistent across themes and Themery previews.
      local function set_header_hl()
        -- Make sure we override any theme-provided link
        pcall(vim.api.nvim_set_hl, 0, 'DashboardHeader', { fg = '#D9CCC3', bold = true })
      end

      -- Apply immediately (in case this runs after colorscheme)
      set_header_hl()

      -- Re-apply on typical cases that can override the group:
      local aug = vim.api.nvim_create_augroup('CustomDashboardHeaderHL', { clear = true })
      -- 1) Any colorscheme change (Themery, :colorscheme, etc.)
      vim.api.nvim_create_autocmd('ColorScheme', { group = aug, callback = set_header_hl })
      -- 2) When the dashboard buffer is created
      vim.api.nvim_create_autocmd('FileType', {
        group = aug,
        pattern = 'dashboard',
        callback = set_header_hl,
      })
      -- 3) After UI fully starts (race-proof with a tiny defer)
      vim.api.nvim_create_autocmd('VimEnter', {
        group = aug,
        callback = function()
          vim.defer_fn(set_header_hl, 50)
        end,
      })

      db.setup {
        theme = 'doom', -- 'doom' gives a simple header/center/footer layout
        hide = {
          statusline = true, -- hide the statusline on the dashboard
          tabline = true, -- hide the tabline on the dashboard
          winbar = true, -- hide the winbar on the dashboard
        },
        config = {
          -- === Header (ASCII art) ======================================================
          -- Using a raw multiline string + vim.split preserves all leading spaces.
          header = {
            [[                                                                       ]],
            [[                                                                     ]],
            [[       ████ ██████           █████      ██                     ]],
            [[      ███████████             █████                             ]],
            [[      █████████ ███████████████████ ███   ███████████   ]],
            [[     █████████  ███    █████████████ █████ ██████████████   ]],
            [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
            [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
            [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
            [[                                                                       ]],
          },

          -- === Center (menu actions) ===================================================
          -- Each item supports: icon, desc, key, keymap, action
          center = {
            {
              icon = '  ',
              desc = 'New file',
              key = 'n',
              action = 'enew | startinsert',
            },
            {
              icon = '  ',
              desc = 'Find files',
              key = 'f',
              -- Show hidden files & don’t respect .gitignore to reveal everything
              action = 'Telescope find_files hidden=true no_ignore=true',
            },
            {
              icon = '  ',
              desc = 'Live grep (ripgrep)',
              key = 'g',
              action = 'Telescope live_grep',
            },
            {
              icon = '  ',
              desc = 'Recent files',
              key = 'r',
              action = 'Telescope oldfiles',
            },
            {
              icon = '  ',
              desc = 'Edit Neovim config',
              key = 'c',
              action = 'Telescope find_files cwd=' .. vim.fn.stdpath 'config',
            },
            {
              icon = '󰚰  ',
              desc = 'Update plugins',
              key = 'u',
              action = 'Lazy sync',
            },
            {
              icon = '  ',
              desc = 'Restore last session',
              key = 's',
              -- Works if you use a session manager (e.g., 'folke/persistence.nvim')
              action = "lua pcall(function() require('persistence').load() end)",
            },
            {
              icon = '  ',
              desc = 'Quit',
              key = 'q',
              action = 'quit',
            },
          },

          -- === Footer ==================================================================
          footer = function()
            -- You can compute something dynamic here (plugin count, date, etc.)
            local ver = vim.version()
            local vstr = string.format('Neovim v%d.%d.%d', ver.major, ver.minor, ver.patch)
            return { '🍌', vstr }
          end,
        },
      }
    end,
  },
}
