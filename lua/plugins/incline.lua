return {
  -- filename
  "b0o/incline.nvim",
  event = "BufReadPre",
  priority = 1200,
  config = function()
    local colors = require("tokyonight.colors").setup()
    local incline = require("incline")

    if not incline then
      return nil
    end

    incline.setup({
      highlight = {
        groups = {
          InclineNormal = {
            guibg = colors.bg_popup,
            guifg = colors.fg,
          },
          InclineNormalNC = {
            guibg = colors.bg_popup,
            guifg = colors.fg,
          },
        },
      },
      window = {
        margin = { vertical = 0, horizontal = 1 },
      },
      hide = {
        cursorline = true,
      },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")

        if vim.bo[props.buf].modified then
          filename = "[+]" .. filename
        end

        local icon, color = require("nvim-web-devicons").get_icon_color(filename)
        if not icon or not color then
          return nil
        end

        return {
          { icon, guifg = color },
          { " ", { filename } },
        }
      end,
    })
  end,
}
