-- ~/.config/nvim/lua/custom/plugins/sonokai.lua
return {
  'sainnhe/sonokai',
  priority = 1000, -- load early so it's ready when Themery previews
  lazy = false, -- optional; helps with live preview restore on start
  -- Use `init` for globals so they’re set before the theme is applied
  init = function()
    local function set_header_hl()
      local color = '#FAC734'

      -- For dashboard-nvim
      pcall(vim.api.nvim_set_hl, 0, 'DashboardHeader', { fg = color, bold = true })

      -- For alpha-nvim (if you use it)
      pcall(vim.api.nvim_set_hl, 0, 'AlphaHeader', { fg = color, bold = true })
    end

    vim.g.sonokai_style = 'maia' -- choose: default/andromeda/shusia/maia/espresso/atlantis
    vim.g.sonokai_transparent_background = 0 -- set 1 if you want transparency
    vim.g.sonokai_better_performance = 1 -- optional perf tweak
  end,
  -- No config needed; DO NOT call colorscheme here, Themery will do it
}
