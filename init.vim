"==================== Basic settings ====================
set nocompatible

" Enable Windows behaviour and mouse
"runtime mswin.vim
" Unmap CTRL-Y for undo in mswin.vim first
"unmap <C-Y>
"unmap <C-A>

if has('mouse')
    set mouse=a
endif

" Common settings
set number
set noswapfile
set nobackup
set shiftwidth=2
set tabstop=2
set expandtab
set wrap
set linebreak
set foldmethod=manual
set foldlevelstart=99
set ignorecase
set smartcase
set history=100     
" Command history
set autochdir
"set colorcolumn=81
"set spell
"set list
filetype plugin on
" No show preview window for completion
set completeopt-=preview

" Set autoread when a file is changed outside
"set autoread
autocmd FocusGained * silent! checktime
"autocmd FocusGained * set guifont=IBM\ 3270:h20:b

" Auto save changes when vim automatically switch buffers
set autowrite

" Always show tabpage
set showtabline=0
"0 1 2

" Set key map timeouts
"set notimeout
set ttimeoutlen=200    " 1000 = 1 second

"==================== Advanced settings ====================
" Use true color
if (has("termguicolors"))
  set termguicolors
endif

"set t_Co=256

" Use ripgrep instead of vimgrep
if executable("rg")
  set grepprg=rg\ --vimgrep\ --no-heading
endif

"==================== Make Neovim with python support ====================
" Need to installe Python3 first, and then run `py -3 -m pip install pynvim`.
" Execute `:checkhealth` for vim health checks to see python support status.
" Set Python path
"let g:python_host_prog  = "C:/Python27/python.exe"
let g:python3_host_prog = "d:/html/python/python.exe"

"
"==================== Leader key ====================
" Set your leader key. The default leader key is '\'

"-------- Use `Space` as leader key --------
let mapleader = "\<Space>"
map <S-F1> :WhichKey '<Space>'<CR>

"sc
set columns=50
set lines=23
set encoding=utf-8
set fencs =ucs-bom,utf8,default,gbk,latin1 

set clipboard+=unnamedplus
set scrolloff=4
" --- line edit ---
let g:multi_cursor_use_default_mapping=0

" Default mapping
let g:multi_cursor_start_word_key      = '<C-n>'
let g:multi_cursor_select_all_word_key = '<A-n>'
let g:multi_cursor_start_key           = 'g<C-n>'
let g:multi_cursor_select_all_key      = 'g<A-n>'
let g:multi_cursor_next_key            = '<C-n>'
let g:multi_cursor_prev_key            = '<C-p>'
let g:multi_cursor_skip_key            = '<C-x>'
let g:multi_cursor_quit_key            = '<Esc>'

" --- emmet ---
"let g:user_emmet_mode='n'    "only enable normal mode functions.
"let g:user_emmet_mode='inv'  "enable all functions, which is equal to
"let g:user_emmet_mode='a'    "enable all function in all mode.
"let g:user_emmet_install_global = 0
"autocmd FileType html,css EmmetInstall
"let g:user_emmet_leader_key='<C-Z>'
"

"
"imap aa  foo
"insert mode input aa  output foo
"iunmap aa  
"del aa
"
"
" Startify
let g:startify_lists = [
			\ { 'type': 'files',		 'header': ['	 MRU'] },
			\ { 'type': 'bookmarks', 'header': ['	 Bookmarks'] },
			\ { 'type': 'commands',	'header': ['	 Commands']	},
			\ ]

" --- coc config---
"
" fix the most annoying bug that coc has
 silent! au BufEnter,BufRead,BufNewFile * silent! unmap if
 let g:coc_global_extensions = ['coc-python', 'coc-vimlsp', 'coc-emmet', 'coc-html', 'coc-json', 'coc-css', 'coc-tsserver', 'coc-yank', 'coc-lists', 'coc-gitignore']
 set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]	=~ '\s'
endfunction
inoremap <silent><expr> <Tab>
 			\ pumvisible() ? "\<C-n>" :
 			\ <SID>check_back_space() ? "\<Tab>" :
 			\ coc#refresh()
"error
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"enderror


inoremap <silent><expr> <c-space> coc#refresh()
" Useful commands
nnoremap <silent> <space>y :<C-u>CocList -A --normal yank<cr>
nnoremap <silent> gd <Plug>(coc-definition)
nnoremap <silent> gy <Plug>(coc-type-definition)
nnoremap <silent> gi <Plug>(coc-implementation)
nnoremap <silent> gr <Plug>(coc-references)
nnoremap <leader>rn <Plug>(coc-rename)

nnoremap <silent> ft :set guifont=IBM\ 3270:h20<cr>
"==================== Plugin manager ====================
"-------- Specify a directory for plugins --------
call plug#begin('~/AppData/Local/nvim/plugged')
"sc
"
Plug 'mhinz/vim-startify'
"开始界面最近文件
" Auto Complete
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"coc update after error
"new version need neovim >= 0.4.3
"
Plug 'philc/vimium'
" url browser
Plug 'terryma/vim-multiple-cursors'
"line edit
"Plug 'ryanoasis/vim-devicons'
"directory icon
"Plug 'mattn/emmet-vim'
"emmet 

"--------------------------------------------------------
"Plug 'KeithLRobertson/markdown-viewer'
"firefox ext 然后么反应....
""Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
"very not like
"Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
"--------------------------------------------------------
"markdown preview

"-------- Basic Plugins --------
Plug 'bling/vim-airline'
" tabbar style
Plug 'vim-airline/vim-airline-themes'
Plug 'vim-scripts/sessionman.vim'
Plug 'jlanzarotta/bufexplorer'
Plug 'easymotion/vim-easymotion'
Plug 'scrooloose/nerdtree',        { 'on': 'NERDTreeToggle' }
Plug 'unkiwii/vim-nerdtree-sync'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar',          { 'on': 'TagbarToggle' }
Plug 'ervandew/supertab'
Plug 'vim-scripts/OmniCppComplete'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-surround'
"更改包裹两端符号
Plug 'godlygeek/tabular'
Plug 'hari-rangarajan/CCTree'
Plug 'plasticboy/vim-markdown'
Plug 'mbbill/undotree'
Plug 'sukima/xmledit'
Plug 'liuchengxu/vim-which-key',   { 'on': ['WhichKey', 'WhichKey!'] }
Plug 'skywind3000/asyncrun.vim'
"Plug 'skywind3000/vim-preview'

"-------- regex pattern search --------
" rg.exe need to be in Windows env. PATH (https://github.com/BurntSushi/ripgrep)
Plug 'jremmen/vim-ripgrep'
Plug 'brooth/far.vim'
"Plug 'dkprice/vim-easygrep'
"Plug 'tpope/vim-abolish'

"-------- Fuzzy file seach --------
" 'fzf.exe' need to be in Windows env. PATH (https://github.com/junegunn/fzf)
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'vim-scripts/mru.vim'

"-------- snippets --------
Plug 'honza/vim-snippets'
"Plug 'sirver/UltiSnips'

"-------- git --------
"Plug 'tpope/vim-fugitive'

"-------- Color scheme --------
Plug 'lifepillar/vim-solarized8'
Plug 'NLKNguyen/papercolor-theme'
Plug 'altercation/solarized'


"-------- Initialize plugin system --------
call plug#end()


"==================== Plugin settings ====================
" ---- color scheme ----
colorscheme PaperColor    " default, one, solarized8, darkblue, desert,solarized8_flat, papercolor, desert, slate, SpaceVim, peachpuff
set background=dark            " dark, light

" ---- vim-airline ----
"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#enabled = 1
let g:airline_theme='solarized'    " solarized, bubblegum

" ---- session manager ----
let sessionman_save_on_exit = 0

" ---- NERDTree ----
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" ---- nerdcommenter ----
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDCommentEmptyLines = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = { 'c': { 'left': '//'} }

" ---- vim-nerdtree-sync ----
let g:nerdtree_sync_cursorline = 1

" ---- Tagbar ----
let g:tagbar_sort = 0

" Markdown support, see: https://github.com/majutsushi/tagbar/issues/70
let g:tagbar_type_markdown = {
        \ 'ctagstype' : 'markdown',
        \ 'kinds' : [
                \ 'h:headings',
        \ ],
    \ 'sort' : 0
\ }

" ---- vim-markdown ----
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_conceal = 0

" ---- auto-pairs ----
let g:AutoPairsMapSpace = 0

" ---- OmniCppComplete ----
let OmniCpp_SelectFirstItem = 0
let OmniCpp_ShowPrototypeInAbbr = 1

" ---- supertab ----
let g:SuperTabDefaultCompletionType = "<c-n>"     " Navigate the completion menu from top to bottom
let g:SuperTabCrMapping = 1

" ---- MRU ----
let MRU_Window_Height = 20

" ---- fzf ----
" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   <bang>0 ? fzf#vim#with_preview('up:60%')
  \           : fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)

" [Tags] Command to generate tags file
let g:fzf_tags_command = 'ctags -R --c++-kinds=+p --fields=+iaS --extra=+q'

" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
  \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)

"==================== Map to navigate Windows easily ====================
" Use `ALT+{h,j,k,l}` to navigate windows from any mode
tnoremap <A-h> <C-\><C-N><C-w>h
tnoremap <A-j> <C-\><C-N><C-w>j
tnoremap <A-k> <C-\><C-N><C-w>k
tnoremap <A-l> <C-\><C-N><C-w>l
inoremap <A-h> <C-\><C-N><C-w>h
inoremap <A-j> <C-\><C-N><C-w>j
inoremap <A-k> <C-\><C-N><C-w>k
inoremap <A-l> <C-\><C-N><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l


"==================== Function key map ====================

" Map <Esc> to exit terminal-mode
tnoremap <Esc> <C-\><C-n>

nnoremap <A-e> 3<C-e>
nnoremap <A-y> 3<C-y>

" Toggle netrw file explore on left window.
let g:netrw_winsize = 20
nnoremap <leader>e :Lexplore<CR>

" For ctags jump
nnoremap <leader>] <C-]>
nnoremap <leader>g 2<C-]>
nnoremap <leader>t <C-T>

" Map for CCTree
nnoremap <leader>cdb :CCTreeLoadDB cscope.out<CR>
let g:CCTreeKeyTraceForwardTree = '<C-\>.'
let g:CCTreeKeyTraceReverseTree = '<C-\>,'
let g:CCTreeKeyHilightTree      = '<C-l>'        " Static highlighting
let g:CCTreeKeySaveWindow       = '<C-\>y'
let g:CCTreeKeyToggleWindow     = '<C-\>w'
let g:CCTreeKeyCompressTree     = 'zs'     " Compress call-tree
let g:CCTreeKeyDepthPlus        = '<C-\>='
let g:CCTreeKeyDepthMinus       = '<C-\>-'

" Switch to the path of current editing file
nnoremap <leader>. :cd %:p:h <BAR> pwd<CR>

" fzf
nnoremap <C-p>      :Files<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fb :Buffers<CR>
nnoremap <leader>fh :History<CR>
nnoremap <leader>ft :Tags<CR>

" Preview for markdown
"let g:instant_markdown_browser = 'firefox --new-window'
"bug
"let g:instant_markdown_autostart = 0
"suan/vim-instant-markdown 无法后台运行 启动会将nvim卡进程
"需再开一个nvim才能使用 很烂的感觉

"icmcco preview config
"let g:mkdp_auto_start = 0
"let g:mkdp_auto_close = 1
"let g:mkdp_refresh_slow = 0
"let g:mkdp_command_for_global = 0
"let g:mkdp_open_to_the_world = 0
"let g:mkdp_open_ip = ''
"let g:mkdp_browser = 'firefox' "chromium
"let g:mkdp_echo_preview_url = 0
"let g:mkdp_browserfunc      = ''
"let g:mkdp_preview_options = {
"			\ 'mkit': {},
"			\ 'katex': {},
"			\ 'uml': {},
"			\ 'maid': {},
"			\ 'disable_sync_scroll': 0,
"			\ 'sync_scroll_type': 'middle',
"			\ 'hide_yaml_meta': 1
"			\ }
"let g:mkdp_markdown_css = ''
"let g:mkdp_highlight_css = ''
"let g:mkdp_port = ''
"let g:mkdp_page_title = '「${name}」'


" Clean search (highlight)
nnoremap <silent> <leader><Space><Space> :nohlsearch<CR>
" Close quickfix window
nnoremap <silent> <leader><Space>c       :cclose<CR>

map <F3>   :execute "Rg -w" expand("<cword>") "%"<CR>
map <S-F3> :execute "Rg -w" expand("<cword>")<CR>
map <F4>   :execute "Rg -tc -w" expand("<cword>")<CR>
map <S-F4> :execute "Rg -tc -s -w" expand("<cword>")<CR>

map tt   :NERDTreeToggle<CR>
map <S-F5> :NERDTreeFind <BAR> wincmd l<CR> " Synchronize NERDTree with current opened file
map tbt   :TagbarToggle<CR>

" Quick run via <F8>
map <F8> :call <SID>compile_and_run()<CR>

function! s:compile_and_run()
    if &filetype == 'c'
        :terminal gcc % -o %<.exe && %<.exe
    elseif &filetype == 'python'
        :terminal python %
    endif
endfunction

" Shortcut for sessionman.vim
map <F9>  :SessionSave<CR>
map <F10> :SessionList<CR>

map <F11>   :AsyncRun cscope -bkR<CR>
map <S-F11> :!cscope -bkR<CR>
map <F12>   :AsyncRun ctags -R --c++-kinds=+p --fields=+iaS --extra=+q <CR>
map <S-F12> :AsyncRun ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --exclude=@tags_exclude <CR>


"==================== User defined commands ====================
:command CopyFileName      silent let @+ = expand('%:t')
:command CopyFilePath      silent let @+ = expand('%:p:h')
:command CopyFileNameFull  silent let @+ = expand('%:p')

:command OpenFileLocation  :silent !start explorer /select, "%:p"<CR>

:command TrimTrailingSpace :%s /\s\+$//e
:command ShowColor         :runtime syntax/colortest.vim
:command Tab2Space         :set expandtab | retab
:command Space2Tab         :set noexpandtab | retab!

:command RemoveCtagfiles   :!rm -f tags cscope.out

:command CD2CurrentFile    :cd %:p:h
:command LCD2CurrentFile   :lcd %:p:h

:command GoFanyiBaidu      :silent !start firefox https://fanyi.baidu.com/\#en/zh/
:command GoWikipedia       :silent !start firefox https://en.wikipedia.org/wiki/

:command TerminalTab       :tabnew <BAR> terminal
:command CmdWin            :silent !start cmd
:command GitBash           :!"C:\Program Files\Git\git-bash.exe"

" Close other buffers or use `:tabonly` to close other tabs
:command CloseOtherBuffers :silent %bd | e#

" Workaround for Quickfix window opens inside Tagbar window
"autocmd FileType qf wincmd J
:command Copen             :botright copen

:command Init              :e ~/AppData/Local/nvim/init.vim

" ==================== My cscope settings ====================
if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate
    " show msg when any other cscope db added
    set cscopeverbose

    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    "   's'   symbol: find all references to the token under cursor
    "   'g'   global: find global definition(s) of the token under cursor
    "   'c'   calls:  find all calls to the function name under cursor
    "   't'   text:   find all instances of the text under cursor
    "   'e'   egrep:  egrep search for the word under cursor
    "   'f'   file:   open the filename under cursor
    "   'i'   includes: find files that include the filename under cursor
    "   'd'   called: find functions that function under cursor calls
    "

    nmap <leader>,cs :cs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>,cg :cs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>,cc :cs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>,ct :cs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>,ce :cs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <leader>,cf :cs find f <C-R>=expand("<cfile>")<CR><CR>
    nmap <leader>,ci :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
    nmap <leader>,cd :cs find d <C-R>=expand("<cword>")<CR><CR>
endif
