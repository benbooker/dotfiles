return {
  "kawre/leetcode.nvim",
  dependencies = {
    "nvim-telescope/telescope.nvim",
    "nvim-lua/plenary.nvim",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    arg = "lc",
    lang = "python3",
    injector = {
      ["python3"] = { before = true },
    },
  },
  lazy = false,
}
