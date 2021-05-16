""" REMAP LEADER """

" map , (reverse of ;) to \
noremap \ ,
" use , as <Leader>
let mapleader=','


""" NORMAL + VISUAL + OPERATOR PENDING MODES """

" make Y behave consistently with D and C
noremap Y y$

" toggle visibility of nonprintable characters
map <Leader>h :set list!<CR>

" use ,m to run make
map <leader>m :make!<CR>

" use ,n to hide search results
map <leader>n :nohl<cr>

" reindent whole file (make mark, jump to bof, = to eof, back to mark)
map <leader>i mmgg=G`mmm

map <Leader>f :Files<CR>
map <leader>p :Files ..<cr>
map <leader>b :Buffers<cr>

" tagbar
map <leader>tb :TagbarToggle<cr>

" NERDTree
map <silent> <C-n> :NERDTreeToggle<CR>

map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vi :VimuxInspectRunner<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vz :VimuxZoomRunner<CR>

""" EasyMotion configuration
" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" jump to word
map <Leader>w <Plug>(easymotion-w)

" use ,, to switch btw. alternate files
" this is slow, because easymotion has mapping starting with ,,
" map <Leader><Leader> <C-^>

" replace default search by EM one
" map  / <Plug>(easymotion-sn)
" omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
" map  n <Plug>(easymotion-next)
" map  N <Plug>(easymotion-prev)

" use ,g to jump to tag
" map <Leader>g <c-]>

" RSpec.vim mappings
" map <Leader>t :call RunCurrentSpecFile()<CR>
" map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>


""" NORMAL MODE """

" use enter in normal mode to insert newline
nnoremap <CR> o<Esc>k

" use ctrl + hjkl to move between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nnoremap <silent> <Up>    :cprevious<CR>
nnoremap <silent> <Down>  :cnext<CR>
nnoremap <silent> <Left>  :cpfile<CR>
nnoremap <silent> <Right> :cnfile<CR>

" always use \v mode for search - don't need to escape all special chars
nnoremap / /\v
vnoremap / /\v

" use Alt+k/j to move btw lines while keeping the line in the vertical center of the screen
nmap <M-k> kzz
nmap <M-j> jzz

" show documentation for word under cursor
nnoremap <silent> K :call ShowDocumentation()<CR>

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" edit file in current directory
nnoremap <leader>e :edit <C-R>=fnameescape(expand('%:h')) . '/'<CR>

" search in all windows
nmap <leader>s <Plug>(easymotion-overwin-f)

" neoterm bindings
nmap <leader>tN :Tnew<cr>
nmap <leader>to :Topen<cr>
nmap <leader>tc :Tclose<cr>
nmap <leader>tn :Tnext<cr>
nmap <leader>tp :Tprevious<cr>
nmap <leader>ts <Plug>(neoterm-repl-send)
xmap <leader>ts <Plug>(neoterm-repl-send)
nmap <leader>tl <Plug>(neoterm-repl-send-line)

" switch btw common alternatives, e.g. true/false
nmap <leader>sw :Switch<cr>

" YouCompleteMe bindings
nmap <silent> gd :YcmCompleter GoTo<CR>
nmap <Leader>s :YcmCompleter GetType<CR>

" CoC bindings
nmap <leader>si :CocCommand python.setInterpreter<cr>
" nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
nmap <leader>ref <Plug>(coc-refactor)
" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
nmap <leader>a  <Plug>(coc-codeaction-selected)
xmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
" nmap <silent> <C-d> <Plug>(coc-range-select)
" xmap <silent> <C-d> <Plug>(coc-range-select)
nmap <leader>cf <Plug>(coc-float-hide)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>d  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" nnoremap <leader>bd :call VimuxRunCommand("npm run build-dev")<cr>
" nnoremap <leader>bt :call VimuxRunCommand("npm run build-test")<cr>
" nnoremap <leader>ba :call VimuxRunCommand("npm run build-assets")<cr>
" nnoremap <leader>tt :call VimuxRunCommand("npm run test " . expand("%"))<cr>
" nnoremap <leader>ta :call VimuxRunCommand("npm run tests")<cr>
" nnoremap <leader>tp :call VimuxRunCommand("pyenv activate django3.6 && ./manage.py test")<cr>


""" VISUAL + OPERATOR PENDING MODE """

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)


""" INSERT MODE """

" use C-d as delete in insert mode
inoremap <C-d> <Del>

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ CheckBackSpace() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion.
" inoremap <silent><expr> <c-space> coc#refresh()

" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"


""" COMMAND LINE MODE """

" %% in command expands to current dir
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>


""" TERMINAL MODE """

" use ESC to exit terminal
tnoremap <Esc> <C-\><C-n>
