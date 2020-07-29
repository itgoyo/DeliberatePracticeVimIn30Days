"设置相对行号
set relativenumber

:let mapleader = ","
:let g:mapleader = ","

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


call plug#end()


exec 'cd ' . fnameescape('/Users/itgoyo/Documents/Vim')



" use ctrl+hjkl switch window
" nnoremap <C-l> <C-w>l   这种用法没效果因为已经被方向快捷键拦截了
:noremap <leader>h <C-w>h
:noremap <leader>j <C-w>j
:noremap <leader>k <C-w>k
:noremap <leader>l <C-w>l
"使用leader+w 直接保存
inoremap <leader>w <Esc>:w<cr>
noremap <leader>w :w<cr>

"noremap <D-S> :w<cr>
"noremap <leader>s :w<cr>
":noremap <leader>s :w<cr>
:noremap <leader>p :MarkdownPreview<cr>

"stackoverflow 上面绑定ctrl+s 为保存的回答

noremap <silent> <C-S>          :update<CR>
vnoremap <silent> <C-S>         <C-C>:update<CR>
inoremap <silent> <C-S>         <C-O>:update<CR>

"解决insert模式切换回normal模式下延迟的问题
set timeoutlen=1 ttimeoutlen=0


" install easy-motion
" Plugin 'easymotion/vim-easymotion'




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
au InsertLeave *.go,*.sh,*.php,*.java,*.py,*.md,*.txt,*.html write

" colorscheme
set bg=dark
colorscheme gruvbox

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



" 切换buffer
" Buffer Navigation
nmap <C-[> :bprevious<CR>
nmap <C-]> :bnext<CR>
nmap <M-[> :bprevious<CR>
nmap <M-]> :bnext<CR>

nnoremap <Tab> :bnext<CR>
nnoremap <S-Tab> :bprevious<CR>


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


" 窗口快速切换切换
nmap J <C-w>j
nmap H <C-w>h
nmap K <C-w>k
nmap L <C-w>l
nmap W <C-w>w
" 括号自动不全
inoremap ( (<CR>)<Esc>O
inoremap [ [<CR>]<Esc>O
inoremap { {<CR>}<Esc>O



" 時間顯示 http://vim.wikia.com/wiki/Insert_current_date_or_time
function! DateAndTime()
    redraw
    echohl WarningMsg
        echo strftime("   ⏰ 現在時間 %Y-%m-%d %H:%M:%S ⏰ ")
    echohl NONE
endfunction
nnoremap <M-t> :call DateAndTime()<CR>

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

nnoremap <M-y>  :call AddTitle()<CR>