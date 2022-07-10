local M = {}

local function isempty(s)
	return s == nil or s == ""
end

M.filename = function()
	local filename = vim.fn.expand("%:t")
	local extension = ""
	local file_icon = ""
	local file_icon_color = ""
	local default_file_icon = ""
	local default_file_icon_color = ""

	if not isempty(filename) then
		extension = vim.fn.expand("%:e")

		local default = false

		if isempty(extension) then
			extension = ""
			default = true
		end

		file_icon, file_icon_color = require("nvim-web-devicons").get_icon_color(
			filename,
			extension,
			{ default = default }
		)

		local hl_group = "FileIconColor" .. extension

		vim.api.nvim_set_hl(0, hl_group, { fg = file_icon_color })
		if file_icon == nil then
			file_icon = default_file_icon
			file_icon_color = default_file_icon_color
		end

		return " " .. "%#" .. hl_group .. "#" .. file_icon .. "%*" .. " " .. "%#LineNr#" .. filename .. "%*"
	end
end

return M
