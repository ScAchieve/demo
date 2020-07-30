" C的编译和运行
map <F5> :call CompileRunGcc()<CR>
func! CompileRunGcc()
exec "w"
exec "!gcc % -o %<"
exec "! %<"
endfunc
" C++的编译和运行
map <F6> :call CompileRunGpp()<CR>
func! CompileRunGpp()
exec "w"
exec "!g++ % -o %<"
exec "! ./%<"
endfunc
set showmatch
"短暂跳转匹配括号的对应括号
"set shortmess=at|
set nocompatible
"不兼容模式
source $VIMRUNTIME/vimrc_example.vim
""source $VIMRUNTIME/mswin.vim
""behave mswin
"使用系统复制　ctrl + v复制　功能　键

set nu
"一直显示行号
"set ambiwidth = double
set sw=4
"tab宽度为2个字符
set ts=4
"编辑时将所有TAB替换为空格
set et
"按一次删除删除4　个空格
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
        
"自动检测编码脚本

set clipboard=unnamed
"使用系统剪贴板

"主题设置
colo slate
"set diffexpr=MyDiff()
"function MyDiff()
"不生成备份文件
set nobackup
"关闭上侧工具栏
set guioptions-=r
set guioptions-=T
"关闭右侧滚动条
"set hls
"搜索高亮显示文本
"set is 
"递进搜索

syntax on
syntax enable
set langmenu=zh_CN.UTF-8
"language message zh_CN.UTF-8
set helplang=cn

"菜单乱码
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
set ignorecase smartcase
set incsearch
set gdefault

set autochdir
set completeopt=longest,menu
"字体
set guifont=黑体:h24:cGB2312
"防止特殊字符号无法正常显示
set ambiwidth=double

set ruler
"状态栏显示当前光标所在位置
set cursorline
"突出显示当前行
set smartindent
":开启新行时智能缩进
"set ai
"开启自动缩进 两种缩进方式好像
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
"设置默认生成C文件　　和默认目录
"set filetype=c
"lcd E:\TDM-GCC-64\bin

lcd d:\html
set lbr
"让单词不中断前提下换行
"这个是在正常模式下按指定的按键  执行一个命令
inoremap ( ()<LEFT>
inoremap [ []<LEFT>
inoremap { {}<LEFT>
inoremap " ""<LEFT>

map <LEADER><LEADER> <Esc>/<==><CR>:nohlsearch<CR>c4l<esc>

filetype off
filetype plugin indent on
"使用Vundle管理插件这两个要这样设置 ...
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
"旧版本
""Plugin 'garbs/vim-snipmate'

Plugin 'tomtom/tlib_vim'
Plugin 'vim-addon-mw-utils'
Plugin 'honza/vim-snipmate'
"使用snipMate 新版这两个必须安装"

Plugin 'paroxayte/vwm.vim'
call vundle#end()   
let g:neocomplcache_enable_at_startup = 1
" 代码提示插件

""let g:snippets_dir='$VIM/vimfiles/snippets/'
""ino <tab> <c-r>=TriggerSnippet()<cr>
""snor <tab> <esc>i<right><c-r>=TriggerSnippet()<cr>

"ab hh hello
"iab hh hello
"用来定义缩写 可使用<c-]/space/tab> 来应用实例单词 i代表在插入模式下
"当输入hh后按以上三种即可把hh替换成hello
"ab hh hello<left>
"可以在缩写后移动光标
"paste' 选项打开时，缩写被禁止。


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
