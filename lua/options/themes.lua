local cmd = vim.cmd
local colorschemes = {
	zep					= 'zephyr',
	one					= 'onedark',
	gruv				= 'gruvbox',
	palenight		= 'palenight',
	tokyon			= 'tokyonight',
	material		= 'material',
	neosol			= 'NeoSolarized',
	catpp				= 'catppuccin',
	nightowl		= 'night-owl'
}

cmd('colorscheme '..colorschemes.zep)
