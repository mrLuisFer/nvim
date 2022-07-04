require'nvim-treesitter.configs'.setup {
	ensure_installed = {
		'css',
		'go',
		'gomod',
		'graphql',
		'javascript',
	  'python',
		'scss',
		'svelte',
		'tsx',
		'prisma',
		'typescript',
		'vue',
		'vim',
		'lua'
  },
	highlight = {
  	enable = true,
    additional_vim_regex_highlighting = false,
  },
}
