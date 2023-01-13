local cmd = vim.cmd
local colorschemes = {
	zep						= 'zephyr',
	one						= 'onedark',
	onedark						= 'onedark',
	gruv					= 'gruvbox',
	palenight			= 'palenight',
	tokyon				= 'tokyonight',
	neosol				= 'NeoSolarized',
	nightowl			= 'night-owl',
	everblush			= 'everblush',
  vscode        = 'vscode'
}
vim.g.everblushNR = 1

cmd('colorscheme '..colorschemes.zep)

return colorschemes
