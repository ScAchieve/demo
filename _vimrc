" C�ı��������
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"
exec "!gcc % -o %<"
exec "! %<"
endfunc
" C++�ı��������
map <F6> :call CompileRunGpp()<CR>
func! CompileRunGpp()
exec "w"
exec "!g++ % -o %<"
exec "! ./%<"
endfunc
set showmatch
"������תƥ�����ŵĶ�Ӧ����
"set shortmess=at|
set nocompatible
"������ģʽ
source $VIMRUNTIME/vimrc_example.vim
""source $VIMRUNTIME/mswin.vim
""behave mswin
"ʹ��ϵͳ���ơ�ctrl + v���ơ����ܡ���

set nu
"һֱ��ʾ�к�
"set ambiwidth = double
set sw=4
"tab���Ϊ2���ַ�
set ts=4
"�༭ʱ������TAB�滻Ϊ�ո�
set et
"��һ��ɾ��ɾ��4�����ո�
set softtabstop=4
set backspace=indent,eol,start

"Encoding setting
if has("multi_byte")
      if getfsize(expand("%")) > 0
            set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,latinl
      else 
            set fileencodings=cp936,big5,euc-jp,euc-kr,latinl
      endif

      "CJK enviroment detection and corresponding setting
      if v:lang =~ "^zh_CN"
            set encoding=cp936
            set termencoding=cp936
            set fileencoding=cp936
      elseif v:lang =~ "^zh_TW"
            set encoding=big5
            set termencoding=big5
            set fileencoding=big5
       elseif v:lang =~ "^ko"
       " Copied from someone's dotfile, untested
       set encoding=euc-kr
       set termencoding=euc-kr
       set fileencoding=euc-kr
       elseif v:lang =~ "^ja_JP"
       " Copied from someone's dotfile, unteste
       set encoding=euc-jp
       set termencoding=euc-jp
       set fileencoding=euc-jp
       endif
       " Detect UTF-8 locale, and replace CJK setting if needed
       if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
       set encoding=utf-8
       set termencoding=utf-8
       set fileencoding=utf-8
       endif
      else
 echoerr "Sorry, this version of (g)vim was not compiled with multi_byte"
endif
        
"�Զ�������ű�

set clipboard=unnamed
"ʹ��ϵͳ������

"��������
colo slate
"set diffexpr=MyDiff()
"function MyDiff()
"�����ɱ����ļ�
set nobackup
"�ر��ϲ๤����
set guioptions-=r
set guioptions-=T
"�ر��Ҳ������
"set hls
"����������ʾ�ı�
"set is 
"�ݽ�����

syntax on
syntax enable
set langmenu=zh_CN.UTF-8
"language message zh_CN.UTF-8
set helplang=cn

"�˵�����
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
set ignorecase smartcase
set incsearch
set gdefault

set autochdir
set completeopt=longest,menu
"����
set guifont=����:h24:cGB2312
"��ֹ�����ַ����޷�������ʾ
set ambiwidth=double

set ruler
"״̬����ʾ��ǰ�������λ��
set cursorline
"ͻ����ʾ��ǰ��
set smartindent
":��������ʱ��������
"set ai
"�����Զ����� ����������ʽ����
set laststatus=2

"Ctags
set tags=ctags;
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_Auto_Open=0
let Tlist_Ctags_Cmd='d:\lqwr\vim\vim74\ctags'
"let Tlist_Ctags_Cmd='/usr/bin/ctags'
"linux on
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<cr>
"����Ĭ������C�ļ�������Ĭ��Ŀ¼
"set filetype=c
"lcd E:\TDM-GCC-64\bin

lcd d:\html
set lbr
"�õ��ʲ��ж�ǰ���»���
"�����������ģʽ�°�ָ���İ���  ִ��һ������
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>
inoremap " ""<LEFT>

map <LEADER><LEADER> <Esc>/<==><CR>:nohlsearch<CR>c4l<esc>

filetype off
filetype plugin indent on
"ʹ��Vundle������������Ҫ�������� ...
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin('$Vim\vimfiles\.vim\bundle\')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
""Plugin 'tpope/vim-fugitive'
""Plugin 'git://git.wincent.com/command-t.git'
""Plugin 'file:///home/gmarik/path/to/plugin'
""Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"
Plugin 'neocomplcache'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
"Plugin 'Shougo/neocomplcache-snippets-complete'
"�ɰ汾
""Plugin 'garbs/vim-snipmate'

Plugin 'tomtom/tlib_vim'
Plugin 'vim-addon-mw-utils'
Plugin 'honza/vim-snipmate'
"ʹ��snipMate �°����������밲װ"

Plugin 'paroxayte/vwm.vim'
call vundle#end()   
let g:neocomplcache_enable_at_startup = 1
" ������ʾ���

""let g:snippets_dir='$VIM/vimfiles/snippets/'
""ino <tab> <c-r>=TriggerSnippet()<cr>
""snor <tab> <esc>i<right><c-r>=TriggerSnippet()<cr>

"ab hh hello
"iab hh hello
"����������д ��ʹ��<c-]/space/tab> ��Ӧ��ʵ������ i�����ڲ���ģʽ��
"������hh���������ּ��ɰ�hh�滻��hello
"ab hh hello<left>
"��������д���ƶ����
"paste' ѡ���ʱ����д����ֹ��


set diffexpr=MyDiff()
function MyDiff() 
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
