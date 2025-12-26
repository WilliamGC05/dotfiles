-- ~/.config/nvim/lua/custom/plugins/onedarkpro.lua
return {
  'olimorris/onedarkpro.nvim',
  priority = 1000, -- ensures it loads before UI/highlight-dependent plugins

  config = function()
    require('onedarkpro').setup {
      -- Theme configuration
      options = {
        transparency = false, -- set true if you want transparent background
        terminal_colors = true,
      },

      styles = {
        comments = 'italic',
        keywords = 'bold',
      },

      -- You can pick a default variant or leave it empty for Themery to handle
      -- theme = "onedark_vivid",  -- uncomment to force a specific variant
    }
  end,
}
