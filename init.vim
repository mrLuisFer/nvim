" A fastest and minimal neovim config :D
" By: mrLuisFer
syntax on
syntax enable

let mapleader = " "
" Setters:
" set relativenumber
set number
set mouse=a
set sw=2
set backspace=2
set guioptions-=T
set guioptions-=L
set nocompatible
set path+=**
set encoding=utf-8
set inccommand=split
set ai
set si 
set nobackup
set nowritebackup
set shortmess+=c
set completeopt=menuone,noinsert,noselect
set showcmd
set ruler
set showmatch
set hlsearch
set title
set smarttab
set smartindent
set hidden
set termguicolors
set laststatus=2
set showtabline=2
set scrolloff=3
set shiftwidth=2
set tabstop=2
set cmdheight=1
" set updatetime=300
" set background="dark"
set clipboard="unnamed"

" Check_python3_host:
if has("win32") || has("win64") || has("win16") || has('win95')
	let g:python3_host_prog = 'C:\Python39\python.exe'

	function! Check_python()
		if has("python3")
			echomsg "python3 detected"
			if !exists("g:os")
				if has("win64") || has("win32") || has("win16") || has('win95')
					let g:os = "Windows"
 				else
					let g:os = substitute(system("uname"), '\ņ', '', '')
				endif
			endif
			if g:os == "Windows"
				let g:python3_host_prog = system('scoop which python')
			elseif g:os == 'Linux' || g:os == 'Unix'
				let g:python3_host_prog = system('which python3')
			endif
		else
			echoerr 'Python 3 support needed'
		endif
	endfunction
endif

" Colorscheme:
" colorscheme material
colorscheme onedark
" colorscheme tender

" Lua_Files:
lua require("plugins")
lua require("plugins/colorizer-config")
lua require("plugins/dashboard-config")
lua require("plugins/lualine-config")
lua require("plugins/treelua-config")
lua require("plugins/cmp-config")
lua require("plugins/bufferline-config")

if has('linux') || has('unix')
	lua require("plugins/treesitter-config")
end

" IDE Mappings:
nnoremap <leader>so :so%<CR>
nnoremap <leader>w :w<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>x :x<CR>

" Treelua_mappings:
nnoremap <C-b> :NvimTreeToggle<CR>

" Nvim_Dashboard:
nnoremap <leader>ff :DashboardFindFile<CR>
nnoremap <leader>fw :DashboardFindWord<CR>
nnoremap <F3> :Dashboard<CR>

" remove dashboard buffer
autocmd FileType dashboard set showtabline=0 | autocmd WinLeave <buffer> set showtabline=2
 
let g:dashboard_custom_header =<< trim END
	N E O V I M                                 
END

