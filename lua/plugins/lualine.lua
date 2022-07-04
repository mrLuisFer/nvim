require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'tokyonight',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {},
    always_divide_middle = true,
    globalstatus = false,
  },
  sections = {
		lualine_a = {
			{
				'mode',
				colored = true
			},
			{
				'fileformat',
				symbols = {
					unix = '', -- e712
					dos = '',  -- e70f
					mac = '',  -- e711
				}
			},
		},
    lualine_b = {
			'branch',
			'diff',
			{
				'diagnostics',
				colored = true,
				always_visible = true
			}
		},
    lualine_c = {
			{
				'filename',
				file_status = true,
				symbols = {
					modified = '[+]',
					readonly = '[-]',
				}
			},
		},
    lualine_x = {
			'encoding',
			'filetype'
		},
    lualine_y = {'progress'},
    lualine_z = {
			'location',
			'fileformat',
		}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = {'quickfix', 'fzf', 'neo-tree', 'nvim-tree'}
}
