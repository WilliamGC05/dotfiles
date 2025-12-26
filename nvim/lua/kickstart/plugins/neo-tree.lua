-- ~/.config/nvim/lua/plugins/neo-tree.lua
-- Neo-tree: modern file explorer for Neovim
-- Docs: https://github.com/nvim-neo-tree/neo-tree.nvim
--
-- Notes:
--   - Opens a tree-based file explorer in a side panel
--   - Supports filesystem, git, and buffers view
--   - Can show hidden (dot) files and gitignored files
--   - Common keys: <CR> to open, 'H' to toggle hidden, 'R' to refresh

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*', -- use the latest stable tag; you can pin a commit if needed
  dependencies = {
    'nvim-lua/plenary.nvim', -- essential Lua helper library
    'nvim-tree/nvim-web-devicons', -- optional but recommended for icons
    'MunifTanjim/nui.nvim', -- UI component library used by Neo-tree
  },

  lazy = false, -- load on startup (set to true if you prefer lazy loading)

  -- Keybindings to open Neo-tree
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal current file', silent = true },
  },

  opts = {
    filesystem = {
      -- Filtering and visibility options for the file tree
      filtered_items = {
        visible = true, -- When true, all files are shown (including hidden)
        hide_dotfiles = false, -- Do NOT hide dotfiles (e.g. .bashrc, .gitignore)
        hide_gitignored = false, -- Optional: show gitignored files too
        hide_by_name = {}, -- You can list specific files to hide (e.g. { "node_modules" })
        never_show = {}, -- Files that should *never* be shown, even if visible=true
      },

      -- Neo-tree window behavior and key mappings
      window = {
        mappings = {
          ['\\'] = 'close_window', -- Press '\' again to close Neo-tree
          ['H'] = 'toggle_hidden', -- Built-in toggle for hidden/dotfiles
          ['R'] = 'refresh', -- Reload the tree if you make external changes
        },
      },

      -- File watching behavior (auto updates when files change)
      follow_current_file = {
        enabled = true, -- Keep the tree focused on the current buffer
        leave_dirs_open = true, -- Keep expanded dirs open when switching files
      },

      -- How Neo-tree opens files
      hijack_netrw_behavior = 'open_current', -- replace netrw with Neo-tree
    },
  },
}
