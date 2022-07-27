local fn  =   vim.fn
local opt =   vim.opt
local g   =   vim.g

local options = {
  ruler          = true,
  clipboard      = "unnamed,unnamedplus",   --- Copy-paste between vim and everything else
  completeopt    = "menu,menuone,noselect,noinsert", --- Better autocompletion
  cursorline     = true,                    --- Highlight of current line
  emoji          = true,                    --- Fix emoji display
  expandtab      = true,                    --- Use spaces instead of tabs
  foldlevelstart = 99,                      --- Expand all folds by default
  foldtext       = "CustomFold()",          --- Emit custom function for foldtext
  ignorecase     = true,                    --- Needed for smartcase
  laststatus     = 3,                       --- Have a global statusline at the bottom instead of one for each window
  lazyredraw     = true,                    --- Makes macros faster & prevent errors in complicated mappings
  mouse          = "a",                     --- Enable mouse
  number         = true,                    --- Shows current line number
  pumheight      = 10,                      --- Max num of items in completion menu
  relativenumber = true,                    --- Enables relative number
  scrolloff      = 8,                       --- Always keep space when scrolling to bottom/top edge
  shiftwidth     = 2,                       --- Change a number of space characeters inseted for indentation
  showtabline    = 2,                       --- Always show tabs
  signcolumn     = "yes:1",                 --- Add extra sign column next to line number
  smartcase      = true,                    --- Uses case in search
  smartindent    = true,                    --- Makes indenting smart
  smarttab       = true,                    --- Makes tabbing smarter will realize you have 2 vs 4
  softtabstop    = 2,                       --- Insert 2 spaces for a tab
  splitright     = true,                    --- Vertical splits will automatically be to the right
  swapfile       = false,                   --- Swap not needed
  tabstop        = 2,                       --- Insert 2 spaces for a tab
  termguicolors  = true,                    --- Correct terminal colors
  timeoutlen     = 200,                     --- Faster completion (cannot be lower than 200 because then commenting doesn't work)
  undofile       = true,                    --- Sets undo to file
  updatetime     = 100,                     --- Faster completion
  viminfo        = "'1000",                 --- Increase the size of file history
  wildignore     = { "*node_modules/**", '**/coverage/**', '**/.idea/**', '**/.nuxt/**' }, --- Don't search inside Node.js modules
  wrap           = false,                   --- Display long lines as just one line
  autoindent     = true,                    --- Good auto indent
  backspace      = "indent,eol,start",      --- Making sure backspace works
  conceallevel   = 1,                       --- Show `` in markdown files
  encoding       = "utf-8",                 --- The encoding displayed
  errorbells     = false,                   --- Disables sound effect for errors
  fileencoding   = "utf-8",                 --- The encoding written to file
  incsearch      = true,                    --- Start searching before pressing enter
  showmode       = false,                   --- Don't show things like -- INSERT -- anymore
  hidden         = true,
  joinspaces     = false,										-- Prevent inserting two spaces with J
  suffixesadd    = { '.md', '.js', '.ts', '.tsx', '.jsx' }, -- File extensions not required when opening with `gf`
  cmdheight      = 1,                       --- Give more space for displaying messages
  confirm        = true,
  inccommand     = 'nosplit',								-- Show preview of ex commands
  whichwrap      = opt.whichwrap + 'h,l,<,>,[,]',
  fillchars      = {
                  eob = ' ',                -- Suppress ~ at EndOfBuffer
                  fold = ' ',               -- Hide trailing folding characters
                 },
}

local globals = {
  fillchars                           = "fold:\\ ", --- Fill chars needed for folds
  mapleader                           = ' ',        --- Map leader key to SPC
  speeddating_no_mappings             = 1,          --- Disable default mappings for speeddating
  vim_svelte_plugin_load_full_syntax  = 1,
  neoline_disable_tabline             = 1,
}

for k, v in pairs(options) do
  opt[k] = v
end

for k, v in pairs(globals) do
  g[k] = v
end

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
