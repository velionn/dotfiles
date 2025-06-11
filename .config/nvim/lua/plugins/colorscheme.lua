return {
  {
    "folke/tokyonight.nvim",
    lazy = false, -- Load on startup
    priority = 1000, -- Ensure it loads before other plugins
    opts = {
      style = "night", -- options: "storm", "night", "moon", "day"
      transparent = false, -- or true, if your terminal uses transparency
      terminal_colors = true,
    },
    config = function(_, opts)
      require("tokyonight").setup(opts)
      vim.cmd.colorscheme "tokyonight"
    end,
  },
}
