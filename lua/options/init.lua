local fn  =   vim.fn
local opt =   vim.opt
local g   =   vim.g

opt.ruler          = true
opt.clipboard      = "unnamed,unnamedplus"   --- Copy-paste between vim and everything else
opt.completeopt    = "menu,menuone,noselect,noinsert" --- Better autocompletion
opt.cursorline     = true                    --- Highlight of current line
opt.emoji          = true                    --- Fix emoji display
opt.expandtab      = true                    --- Use spaces instead of tabs
opt.foldlevelstart = 99                      --- Expand all folds by default
opt.foldtext       = "CustomFold()"          --- Emit custom function for foldtext
opt.ignorecase     = true                    --- Needed for smartcase
opt.laststatus     = 3                       --- Have a global statusline at the bottom instead of one for each window
opt.lazyredraw     = true                    --- Makes macros faster & prevent errors in complicated mappings
opt.mouse          = "a"                     --- Enable mouse
opt.number         = true                    --- Shows current line number
opt.pumheight      = 10                      --- Max num of items in completion menu
opt.relativenumber = true                    --- Enables relative number
opt.scrolloff      = 8                       --- Always keep space when scrolling to bottom/top edge
opt.shiftwidth     = 2                       --- Change a number of space characeters inseted for indentation
opt.showtabline    = 2                       --- Always show tabs
opt.signcolumn     = "yes:1"                 --- Add extra sign column next to line number
opt.smartcase      = true                    --- Uses case in search
opt.smartindent    = true                    --- Makes indenting smart
opt.smarttab       = true                    --- Makes tabbing smarter will realize you have 2 vs 4
opt.softtabstop    = 2                       --- Insert 2 spaces for a tab
opt.splitright     = true                    --- Vertical splits will automatically be to the right
opt.swapfile       = false                   --- Swap not needed
opt.tabstop        = 2                       --- Insert 2 spaces for a tab
opt.termguicolors  = true                    --- Correct terminal colors
opt.timeoutlen     = 200                     --- Faster completion (cannot be lower than 200 because then commenting doesn't work)
opt.undofile       = true                    --- Sets undo to file
opt.updatetime     = 100                     --- Faster completion
opt.viminfo        = "'1000"                 --- Increase the size of file history
opt.wildignore     = { "*node_modules/**", '**/coverage/**', '**/.idea/**', '**/.nuxt/**' } --- Don't search inside Node.js modules
opt.wrap           = false                   --- Display long lines as just one line

  -- Neovim defaults
opt.autoindent     = true                    --- Good auto indent
opt.backspace      = "indent,eol,start"      --- Making sure backspace works
opt.conceallevel   = 1                       --- Show `` in markdown files
opt.encoding       = "utf-8"                 --- The encoding displayed
opt.errorbells     = false                   --- Disables sound effect for errors
opt.fileencoding   = "utf-8"                 --- The encoding written to file
opt.incsearch      = true                    --- Start searching before pressing enter
opt.showmode       = false                   --- Don't show things like -- INSERT -- anymore
opt.hidden         = true
opt.joinspaces     = false										-- Prevent inserting two spaces with J
opt.suffixesadd    = { '.md', '.js', '.ts', '.tsx', '.jsx' } -- File extensions not required when opening with `gf`
opt.cmdheight      = 1                       --- Give more space for displaying messages
opt.confirm        = true
opt.inccommand     = 'nosplit'								-- Show preview of ex commands
opt.whichwrap      = opt.whichwrap + 'h,l,<,>,[,]'
opt.fillchars      = {
                  eob = ' ',                -- Suppress ~ at EndOfBuffer
                  fold = ' ',               -- Hide trailing folding characters
                 }

g.fillchars                           = "fold:\\ " --- Fill chars needed for folds
g.mapleader                           = ' '        --- Map leader key to SPC
g.speeddating_no_mappings             = 1          --- Disable default mappings for speeddating
g.vim_svelte_plugin_load_full_syntax  = 1
g.neoline_disable_tabline             = 1

opt.shortmess:append('c');
opt.formatoptions:remove('c');
opt.formatoptions:remove('r');
opt.formatoptions:remove('o');
opt.sessionoptions:remove { 'buffers', 'folds' }

if fn.has('linux') or fn.has('unix') then
  g.python_host_prog = '/usr/bin/python3'
elseif fn.has('win32') or fn.has('win64') then
  -- Please read the documentation and run in a terminal: Whereis.exe python or python3
  -- and add it between the string
	-- DOCUMENTATION: https://github.com/neovim/neovim/wiki/Installing-Neovim
  g.python_host_prog = ''
end
