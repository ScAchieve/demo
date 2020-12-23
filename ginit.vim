" Set GUI font
GuiFont! IBM 3270:h20:b
set columns 90 lines 20

let s:fontsize = 16
function! AdjustFontSize(amount)
  let s:fontsize = s:fontsize+a:amount
  :execute "GuiFont! Consolas:h" . s:fontsize
endfunction

noremap <C-ScrollWheelUp> :call AdjustFontSize(1)<CR>
noremap <C-ScrollWheelDown> :call AdjustFontSize(-1)<CR>
inoremap <C-ScrollWheelUp> <Esc>:call AdjustFontSize(1)<CR>a
inoremap <C-ScrollWheelDown> <Esc>:call AdjustFontSize(-1)<CR>a

" Use default text-based tab line
GuiTabline 0

" Use default popup menu
GuiPopupmenu 0

" Start nvim with start maximized window
call GuiWindowMaximized(1)

"spaceVim
" if exists('g:GuiLoaded')
"   if empty(g:spacevim_guifont)
"     exe 'Guifont! SauceCodePro Nerd Font Mono:h11:cANSI:qDRAFT'
"   else
"     exe 'Guifont! ' . g:spacevim_guifont
"   endif
"   " As using neovim-qt by default
" 
"   " Disable gui popupmenu
"   if exists(':GuiPopupmenu') == 2
"     GuiPopupmenu 0
"   endif
" 
"   " Disbale gui tabline
"   if exists(':GuiTabline') == 2
"     GuiTabline 0
"   endif
"   if g:spacevim_colorscheme !=# '' "{{{
"     try
"       exec 'set background=' . g:spacevim_colorscheme_bg
"       exec 'colorscheme ' . g:spacevim_colorscheme
"     catch
"       exec 'colorscheme '. g:spacevim_colorscheme_default
"     endtry
"   else
"     exec 'colorscheme '. g:spacevim_colorscheme_default
"   endif
" endif
