-- ~/.config/nvim/lua/custom/plugins/themery.lua
return {
  'zaldih/themery.nvim',
  lazy = false, -- load on startup so your theme is restored immediately
  config = function()
    require('themery').setup {
      -- no themes yet; add them later
      themes = {
        { name = 'One Dark Pro', colorscheme = 'onedark' },
        { name = 'One Dark Pro (Vivid)', colorscheme = 'onedark_vivid' },
        { name = 'One Dark Pro (Dark)', colorscheme = 'onedark_dark' },
        { name = 'Sonokai (Default)', colorscheme = 'sonokai', before = 'vim.g.sonokai_style = "default"' },
        { name = 'Sonokai (Andromeda)', colorscheme = 'sonokai', before = 'vim.g.sonokai_style = "andromeda"' },
        { name = 'Sonokai (Shusia)', colorscheme = 'sonokai', before = 'vim.g.sonokai_style = "shusia"' },
        { name = 'Sonokai (Maia)', colorscheme = 'sonokai', before = 'vim.g.sonokai_style = "maia"' },
        { name = 'Sonokai (Espresso)', colorscheme = 'sonokai', before = 'vim.g.sonokai_style = "espresso"' },
        { name = 'Sonokai (Atlantis)', colorscheme = 'sonokai', before = 'vim.g.sonokai_style = "atlantis"' },
      },

      -- optional: disables live preview for now
      livePreview = true,
    }
  end,
}
