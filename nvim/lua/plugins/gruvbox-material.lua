return {
  "sainnhe/gruvbox-material",
  priority = 1000,
  lazy = false,
  config = function()
    vim.o.background                          = "dark" -- or "light"
    vim.g.gruvbox_material_background         = "hard" -- 'soft' | 'medium' | 'hard'
    vim.g.gruvbox_material_foreground         = "hard" -- 'material' | 'mix' | 'original'
    vim.g.gruvbox_material_better_performance = 1      -- disables unused highlight groups
    vim.cmd.colorscheme("gruvbox-material")
  end,
}
