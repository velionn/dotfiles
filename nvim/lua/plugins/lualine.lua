return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local colors = require("tokyonight.colors").setup({ style = "moon" })

    -- Optional: define your own condition helpers
    local conditions = {
      buffer_not_empty = function()
        return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
      end,
      hide_in_width = function()
        return vim.fn.winwidth(0) > 80
      end,
    }

    local config = {
      options = {
        component_separators = "",
        section_separators = "",
        theme = {
          normal = { c = { fg = colors.fg, bg = colors.bg } },
          inactive = { c = { fg = colors.fg, bg = colors.bg } },
        },
      },
      sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_y = {},
        lualine_z = {},
        lualine_c = {},
        lualine_x = {},
      },
    }

    -- Helper functions to insert components
    local function insert_left(component)
      table.insert(config.sections.lualine_c, component)
    end

    local function insert_right(component)
      table.insert(config.sections.lualine_x, component)
    end

    -- Left section
    insert_left({
      "branch",
      icon = "",
      color = { fg = colors.fg, bg = colors.bg, gui = "bold" },
    })

    insert_left({
      "diff",
      symbols = { added = " ", modified = " ", removed = " " },
      diff_color = {
        added = { fg = colors.green },
        modified = { fg = colors.orange },
        removed = { fg = colors.red },
      },
      cond = conditions.hide_in_width,
    })

    insert_left({
      "diagnostics",
      sources = { "nvim_diagnostic" },
      symbols = { error = " ", warn = " ", info = " " },
      diagnostics_color = {
        color_error = { fg = colors.red },
        color_warn = { fg = colors.yellow },
        color_info = { fg = colors.cyan },
      },
    })

    -- Center separator
    insert_left({
      function()
        return "%="
      end,
    })

    -- Right section
    insert_right({
      "location",
      color = { fg = colors.fg_dark },
      cond = conditions.buffer_not_empty,
    })

    insert_right({ "encoding" })

    insert_right({ "filetype" })

    require("lualine").setup(config)
  end,
}

