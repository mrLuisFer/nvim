require'nvim-treesitter.configs'.setup {
	ensure_installed = "all",
	ignore_install = { 'phpdoc' },
  highlight = {
    enable = true,
  },
  textobjects = {
    select = {
			enable = true,
				keymaps = {
          ["af"] = "@function.outer",
          ["if"] = "@function.inner",
          ["ac"] = "@class.outer",
          ["ic"] = "@class.inner",
        },
    },
  },
}
