
"设置相对行号
set relativenumber

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Keymap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"let mapleader = ","
"let g:mapleader = ","

exec 'cd ' . fnameescape('/Users/itgoyo/Documents/Vim')

let mapleader = ","

nmap <leader>mo :set modifiable<cr>
set modifiable

syntax on " 自动语法高亮

" 键位绑定  Keymap

"<k0> - <k9> 小键盘 0 到 9
"<S-...> Shift＋键
"<C-...> Control＋键
"<M-...> Alt＋键 或 meta＋键
"<A-...> 同 <M-...>
"<Esc> Escape 键
"<Up> 光标上移键
"<Space> 插入空格
"<Tab> 插入 Tab
"<CR> 等于 <Enter>
"<D> Command

" ACK
map <C-a> :Ack<space>

" 窗口快速切换切换
nmap J <C-w>j
nmap H <C-w>h
nmap K <C-w>k
nmap L <C-w>l
nmap W <C-w>w
nmap C <C-w>c

" 括号自动不全
inoremap ( ()<Esc>i
inoremap [ []<Esc>i
inoremap { {<CR>}<Esc>O

:noremap <leader>l <C-w>l
"使用leader+w 直接保存
"nmap <leader>w :w!<cr>
nmap <leader>q :wqall!<cr>

"解决insert模式切换回normal模式下延迟的问题 这货会影响leader的事件触发，最好别用 浪费我很多时间
"set timeoutlen=1 ttimeoutlen=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => 自定义Keymap
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <M-y>  :call AddTitle()<CR>
nnoremap <M-t> :call DateAndTime()<CR>


"Mode Settings

let &t_SI.="\e[5 q" "SI = INSERT mode
let &t_SR.="\e[4 q" "SR = REPLACE mode
let &t_EI.="\e[1 q" "EI = NORMAL mode (ELSE)

"Cursor settings:

"  1 -> blinking block
"  2 -> solid block
"  3 -> blinking underscore
"  4 -> solid underscore
"  5 -> blinking vertical bar
"  6 -> solid vertical bar



"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"




"MarkdownPreview
"let g:instant_markdown_port = 8888

" 退出插入模式指定类型的文件自动保存
au InsertLeave * write



" NERDTree
 map <C-e> :NERDTreeToggle<CR>

" Tagbar
 nmap <C-t> :TagbarToggle<CR>
 " Tagbar
nmap <silent> <leader>tb :TagbarToggle<cr>

" fzf
" Always enable preview window on the right with 60% width
let g:fzf_preview_window = 'right:60%'

nmap <C-z> :Files<CR>
nmap <C-u> :Buffers<CR>


" <Leader>f{char} to move to {char}
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f)

"nmap <Leader>w <Plug>(easymotion-overwin-w)

nnoremap <leader>a :echo("\<leader\> works! It is set to <leader>")<CR>

" Vim-Ranger
map <leader>r :Ranger<CR>.
g:ranger_command_override
let g:ranger_command_override = 'ranger --cmd "set show_hidden=true"'
set shell=bash


" 切换buffer
" Buffer Navigation
"nmap <C-[> :bprevious<CR> 不知道mac hhkb下面是什么原因，如果是这个组合键的话，Caps映射的ESC会经常触发这个所以打算更换快捷键
"nmap <C-]> :bnext<CR>
nmap <M-[> :bprevious<CR>
nmap <M-]> :bnext<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin('~/.vim/plugged')

" vim-airline
Plug 'vim-airline/vim-airline'

" colorscheme gruvbox
Plug 'morhetz/gruvbox'

" nerdtree
Plug 'preservim/nerdtree'

" Tagbar
Plug 'majutsushi/tagbar'

" ctrlp
Plug 'ctrlpvim/ctrlp.vim'

" MarkdownPreview
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}

" Fzf Vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
set rtp+=/usr/local/opt/fzf
Plug '/usr/local/opt/fzf'


" easymotion
Plug 'easymotion/vim-easymotion'

" wakatime
Plug 'wakatime/vim-wakatime'

" indent
Plug 'nathanaelkane/vim-indent-guides'

" COC
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Vim-GO
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" ACK
Plug 'mileszs/ack.vim'

" Vim-Startify
Plug 'mhinz/vim-startify'

" Vim-Surround
Plug 'tpope/vim-surround'

" Vim-Ranger
Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

" Rainbow
Plug 'luochen1990/rainbow'

" Color
Plug 'ap/vim-css-color'


call plug#end()


" ACK
Plug 'mileszs/ack.vim'

" Vim-Startify
Plug 'mhinz/vim-startify'

" Vim-Surround
Plug 'tpope/vim-surround'

call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Methods
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


" 让输入上方，搜索列表在下方
    let $FZF_DEFAULT_OPTS = '--layout=reverse'

    " 打开 fzf 的方式选择 floating window
    let g:fzf_layout = { 'window': 'call OpenFloatingWin()' }

    function! OpenFloatingWin()
  let height = &lines - 3
  let width = float2nr(&columns - (&columns * 2 / 10))
  let col = float2nr((&columns - width) / 2)

  " 设置浮动窗口打开的位置，大小等。
  " 这里的大小配置可能不是那么的 flexible 有继续改进的空间
  let opts = {
        \ 'relative': 'editor',
        \ 'row': height * 0.3,
        \ 'col': col + 30,
        \ 'width': width * 2 / 3,
        \ 'height': height / 2
        \ }

  let buf = nvim_create_buf(v:false, v:true)
  let win = nvim_open_win(buf, v:true, opts)

  " 设置浮动窗口高亮
  call setwinvar(win, '&winhl', 'Normal:Pmenu')

  setlocal
        \ buftype=nofile
        \ nobuflisted
        \ bufhidden=hide
        \ nonumber
        \ norelativenumber
        \ signcolumn=no
endfunction





" 時間顯示 http://vim.wikia.com/wiki/Insert_current_date_or_time
function! DateAndTime()
    redraw
    echohl WarningMsg
        echo strftime("   ⏰ 現在時間 %Y-%m-%d %H:%M:%S ⏰ ")
    echohl NONE
endfunction


" 输入xtime 然后按一下tab按键就可以显示时间了 2020-07-29 16:23:13
iab xtime <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>

function AddTitle()
call append(1,"/**")
call append(2," * Author: itgoyo - itgoyo@gmail.com")
call append(3," * Create time: " . strftime("%Y-%m-%d %H:%M"))
call append(4," * Last modified: " . strftime("%Y-%m-%d %H:%M"))
call append(5," * Filename: " . expand("%"))
call append(6," * Description: ")
call append(7," */")
endf



"have indent guides enabled by default
let g:indent_guides_enable_on_vim_startup = 1

" colorscheme
set bg=dark
colorscheme gruvbox


let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
autocmd FileType go nmap <leader>r <Plug>(go-run) %<CR>
autocmd FileType go nmap <leader>b <Plug>(go-build) %<CR>
autocmd FileType go nmap <leader>t <Plug>(go-test) %<CR>


let g:rainbow_active = 1

autocmd FileType go nmap <leader>t <Plug>(go-test) %<CR>
