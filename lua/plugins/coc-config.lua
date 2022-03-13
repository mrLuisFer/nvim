local function t()

  vim.api.nvim_exec(
  [[
    inoremap <silent><expr> <TAB>
        \ pumvisible() ? "\<C-n>" :
        \ <SID>check_back_space() ? "\<TAB>" :
        \ coc#refresh()
    inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

    function! s:check_back_space() abort
      let col = col('.') - 1
      return !col || getline('.')[col - 1]  =~# '\s'
    endfunction

    set signcolumn=number

    inoremap <silent><expr> <c-space> coc#refresh()

    inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

    nmap <silent> [g <Plug>(coc-diagnostic-prev)
    nmap <silent> ]g <Plug>(coc-diagnostic-next)
    nmap <silent> gd <Plug>(coc-definition)
    nmap <silent> gy <Plug>(coc-type-definition)
    nmap <silent> gi <Plug>(coc-implementation)
    nmap <silent> gr <Plug>(coc-references)

    nnoremap <silent> K :call <SID>show_documentation()<CR>

    function! s:show_documentation()
      if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
      elseif (coc#rpc#ready())
        call CocActionAsync('doHover')
      else
        execute '!' . &keywordprg . " " . expand('<cword>')
      endif
    endfunction

    autocmd CursorHold * silent call CocActionAsync('highlight')

    nmap <leader>rn <Plug>(coc-rename)

    xmap <leader>f  <Plug>(coc-format-selected)
    nmap <leader>f  <Plug>(coc-format-selected)

    augroup mygroup
      autocmd!
      autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
      autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
    augroup end

    xmap <leader>a  <Plug>(coc-codeaction-selected)
    nmap <leader>a  <Plug>(coc-codeaction-selected)

    nmap <leader>ac  <Plug>(coc-codeaction)
    nmap <leader>qf  <Plug>(coc-fix-current)

    nmap <leader>cl  <Plug>(coc-codelens-action)

    xmap if <Plug>(coc-funcobj-i)
    omap if <Plug>(coc-funcobj-i)
    xmap af <Plug>(coc-funcobj-a)
    omap af <Plug>(coc-funcobj-a)
    xmap ic <Plug>(coc-classobj-i)
    omap ic <Plug>(coc-classobj-i)
    xmap ac <Plug>(coc-classobj-a)
    omap ac <Plug>(coc-classobj-a)

    if has('nvim-0.4.0') || has('patch-8.2.0750')
      nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
      nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
      inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
      inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
      vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
      vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
    endif

    nmap <silent> <C-s> <Plug>(coc-range-select)
    xmap <silent> <C-s> <Plug>(coc-range-select)

    command! -nargs=0 Format :call CocActionAsync('format')
    command! -nargs=? Fold :call     CocAction('fold', <f-args>)
    command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')


    nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
    nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
    nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
    nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
    nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
    nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
    nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
    nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>
  ]],
  true) 
end
