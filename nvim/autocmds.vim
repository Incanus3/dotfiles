" maximize window after entering
autocmd WinEnter * wincmd _
" autocmd WinEnter * wincmd |

" filetype associations
autocmd BufRead,BufNewFile *.txt          set filetype=zim
autocmd BufRead,BufNewFile *.md           set filetype=markdown
autocmd BufRead,BufNewFile *.asd          set filetype=lisp
autocmd BufRead,BufNewFile *.tex          set filetype=tex
autocmd BufRead,BufNewFile *.scheme       set filetype=scheme
autocmd BufRead,BufNewFile *.god          set filetype=ruby
autocmd BufRead,BufNewFile *.em           set filetype=emblem
autocmd BufRead,BufNewFile *.py           set textwidth=100 tabstop=2 softtabstop=2 shiftwidth=2 expandtab   foldmethod=indent foldlevelstart=1
autocmd BufRead,BufNewFile */foodie/*.py  set textwidth=100 tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab foldmethod=indent foldlevelstart=1
" autocmd FileType sh set noexpandtab

autocmd BufWritePre * :call StripTrailingWhitespaces()

" complement "use enter in normal mode to insert newline"
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

" autocmd InsertLeave * if pumvisible() == 0 | pclose | endif

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
