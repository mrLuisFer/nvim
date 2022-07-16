local cmd = vim.cmd
local colorschemes = {
	zep						= 'zephyr',
	one						= 'onedark',
	gruv					= 'gruvbox',
	palenight			= 'palenight',
	tokyon				= 'tokyonight',
	neosol				= 'NeoSolarized',
	catpp					= 'catppuccin',
	nightowl			= 'night-owl',
	palenightfall = 'palenightfall',
	everblush			= 'everblush',
  vscode        = 'vscode'
}
require("themes.palenightfall")
vim.g.everblushNR = 1

cmd('colorscheme '..colorschemes.vscode)

return colorschemes
