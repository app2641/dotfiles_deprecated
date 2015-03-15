"d
"gvimの設定

if has('gui_macvim')
"フォント設定
"set guifont=Migu\ 1M:h16
" set guifont=Source\ Code\ Pro\ for\ Powerline:h15
set guifont=Source\ Code\ Pro:h13
"set guifont=ヒラギノ明朝\ Pro:h18

" 縦幅
set lines=40

" 横幅
set columns=140

"全角スペースを視覚化
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=#666666
au BufNewFile,BufRead * match ZenkakuSpace /　/

"常にタブを表示
set showtabline=2

"透明度を変更
:set transparency=3

"???"
"map  gw :macaction selectNextWindow:
"map  gW :macaction selectPreviousWindow:i

:set background=dark

"color schemeの設定
colorscheme jellybeans
if g:colors_name ==? 'mint'
  hi Visual gui=none guifg=khaki guibg=#000000
endif

"バックアップファイルを作成しない
set nobackup

endif

