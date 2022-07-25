local cmd = vim.cmd

cmd([[
  let g:deoplete#enable_at_startup=1
  let g:deoplete#lsp#handler_enabled=1

  let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
  let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
]])
