vim.opt.termguicolors = true

local bg_color = require('palenightfall')

require('notify').setup {
	background_colour = bg_color.colors.background,
}

vim.notify = require 'notify'

local notify = vim.notify
vim.notify = function(msg, ...)
  if type(msg) == 'string' then
    local is_suppressed_message = msg:match '%[lspconfig] Autostart for' or msg:match 'No information available'
    if is_suppressed_message then
      -- Do not show some messages
			print("Not show messages")
      return
    end
  end

  notify(msg, ...)
end
