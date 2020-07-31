<div align=center><img src="https://gitee.com/itgoyo/PicGoRes/raw/master/img/Vim.png"/></div>

![](keymap.png)

# DeliberatePracticeVimIn30Days
刻意练习Vim30天能达到什么效果，是麻瓜，还是成神？

本人使用Vim编程方式来开发已经有3年的经验，但是虽然有三年经验，但也仅仅是使用到Vim比较常用的快捷编辑方式而已，虽然只是懂得这冰山一角，但是已经让我在开发效率上面有了很大的提高，由于本人从事的是Android，还有前端开发，虽然用的是IDE，但是并不影响我使用Vim插件来开发，所以为了更好的发挥Vim的编程优势，还有提高自己的编码效率，于是乎就有了这个仓库。

本人非常喜欢并且崇拜`Bisqwit`敲代码，那种代码在屏幕上快速输出，键指如飞的潇洒，还有喜欢`GeoHotz`使用Vim敲代码的样子，所以本人也暗下励志要成为像他们一样的人，可能做不到他们的那般优秀，但是这并不影响我离他们更近。

| 资源名称 | 简介 |
| --- | --- |
| [七个高效的文本编辑习惯](http://www.moolenaar.net/habits.html) | 作者：Bram Moolenaar（即 Vim 的作者） |
| [《 Vim 实践 (第 2 版)》](https://github.com/itgoyo/DeliberatePracticeVimIn30Days/blob/master/Vim实用技巧（第2版）.pdf) | 轻取 Vim 最佳书籍 |
| [Vim用户手册中文版72](https://github.com/itgoyo/DeliberatePracticeVimIn30Days/blob/master/Vim用户手册中文版72.pdf) | Vim用户手册 |
| [Modern.Vim.2018.5](https://github.com/itgoyo/DeliberatePracticeVimIn30Days/blob/master/Modern.Vim.2018.5.pdf) | 现代Vim |

本人第一次使用的Vim项目是[spf13-vim](https://github.com/spf13/spf13-vim),当初搜Github项目的时候就属它Star最多，后面国人有个项目叫[SpaceVim](https://github.com/SpaceVim/SpaceVim),作者也是一个比较厉害的人，以前每天都能看到他每天满满提交页面。因为项目集成的插件比较多，我印象中的spf13光是插件就有七八十个，启动起来不算卡，但是很多插件都是自己没用过的，自己也没怎么理会了。

本人关于Vim的推荐是先尝试使用别人弄好的Vim dotfiles，因为别人的配置比你的白板强太多了，vim之所以强是因为它有很多插件，就像变形金刚一样自己组装，但是如果你什么都不安装，那么你用Vim真的还不如使用IDE来的快。先尝试使用别人的项目，对Vim操作先熟悉起来，然后再根据自己的需要，定制合适自己的Vim，安装自己需要的插件。

常用Vim插件推荐，更多插件刻意查看[vimawesome](https://vimawesome.com/)
| 资源名称 | 简介 |
| --- | --- |
| [fugitive-vim](https://vimawesome.com/plugin/fugitive-vim) | fugitive.vim: A Git wrapper so awesome, it should be illegal |
|[surround-vim](https://vimawesome.com/plugin/surround-vim)|surround.vim: quoting/parenthesizing made simple|
|[nerdtree](https://vimawesome.com/plugin/nerdtree-red)|A tree explorer plugin for vim|
|[vim-airline](https://vimawesome.com/plugin/vim-airline-superman)|lean & mean status/tabline for vim that's light as air|
|...|[vimawesome](https://vimawesome.com/)|

### 关于本人之前折腾Vim的记录
[Vim折腾帖子](https://github.com/itgoyo/500Days-Of-Github/issues?q=vim)

### Day01
#### 下载安装NeoVim
[NeoVim官网](https://github.com/neovim/neovim)
- Download nvim-macos.tar.gz
- Extract: tar xzvf nvim-macos.tar.gz
- Run ./nvim-osx64/bin/nvim
因为没有桌面快捷启动方式，于是我就在`.zshrc`文件里面映射了快捷启动方式
```
# NeoVim
alias nvim='./nvim-osx64/bin/nvim'
```
每次我只需要在终端里面输入`nvim`就刻意快速打开`NeoVim`了

#### 与Vim的区别

```
~/.vimrc 对应 $CONFIG_HOME/nvim/init.vim

~/.vim 对应 $CONFIG_HOME/nvim

```

Neovim 是能使用 vim 的配置文件的，如果有 vim 的配置，直接软链接就好：

```
$(~) ln -s ~/.vim .config/nvim
$(~) ln -s ~/.vimrc .config/nvim/init.vim

```

如果想 nvim 单独使用一个配置，那就在 .config 下创建配置文件就行：

```
$(~) mkdir .config/nvim
$(~) touch .config/nvim/init.vim
```
之前`spf-13`项目用的插件安装方式是`Vundle`，为了体验别的方式这里就更换成为`VimPlug`来安装插件
第一天先安装一些常用的插件：
```
- Finishing ... Done!                                                                                                 │~
- fzf: Already installed                                                                                              │~
- ctrlp.vim: Already installed                                                                                        │~
- vim-airline: Already installed                                                                                      │~
- tagbar: Already installed                                                                                           │~
- nerdtree: Already installed                                                                                         │~
- fzf.vim: Already installed                                                                                          │~
- vim-instant-markdown: Already installed                                                                             │~
- gruvbox: Already installed
- vim-easymotion: Already installed

```

#### init.vim(.config/nvim/init.vim)
```

"设置相对行号
set relativenumber

:let mapleader=','
:let g:mapleader = ','


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

call plug#end()


exec 'cd ' . fnameescape('/Users/itgoyo/Documents/Vim')


" 切换buffer
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>



" use ctrl+hjkl switch window
" nnoremap <C-l> <C-w>l   这种用法没效果因为已经被方向快捷键拦截了
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
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
"nmap <Leader> f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f)

nmap <Leader>w <Plug>(easymotion-overwin-w)



" 切换buffer
nnoremap <silent> [b :bprevious<CR>
nnoremap <silent> ]b :bnext<CR>
nnoremap <silent> [B :bfirst<CR>
nnoremap <silent> ]B :blast<CR>



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
```

### Day2
#### 自定义一些常用的快捷键
自定义一些常用的快捷键，但是遇到<Leader>按键不起作用的问题，查找了很多资料都没找到是什么原因，最后才发现原来是自己的操作不当引起的，这个<Leader>不是组合按键而是，静默按1s后组合触发按键

发现在`iterm2`里面启动的`nvim`设置`meta`键位是没有作用的，这个是一直存在的问题，查找一下资料看看有没有什么比较好的解决方式

解决方式：[在iterm设置中将left Option设置成Esc+这样子就可以了]
![](https://gitee.com/itgoyo/PicGoRes/raw/master/img/20200729160234.png)

silent 代表不回显，静默的意思

还有学习到了一些简单的Vim功能脚本的使用方法

比如：
```
function! DateAndTime()
    redraw
    echohl WarningMsg
        echo strftime("   ⏰ 現在時間 %Y-%m-%d %H:%M:%S ⏰ ")
    echohl NONE
endfunction


" 输入xtime 然后按一下tab按键就可以显示时间了 2020-07-29 16:23:13
iab xtime <c-r>=strftime("%Y-%m-%d %H:%M:%S")<cr>

nnoremap <M-t> :call DateAndTime()<CR
```
就能简单快速的输出当前的时间

第二天的`init.vim`文件如下
```
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
```
### Day03

原本昨天以为解决了<Leader>键的问题，但是事实上并不是这样子的，昨天只是碰巧能触发而已，并不能随时触发，真正影响<leader>键位功能的是因为一句话引起的
```
"解决insert模式切换回normal模式下延迟的问题 这货会影响leader的事件触发，最好别用 浪费我很多时间
"set timeoutlen=1 ttimeoutlen=0
```
去掉之后现在关于<leader>相关的组合键位都能正常使用了

配置相关的已经提交到Github上面去了

现在终于可以正式入门Vim还有自定义一些属于自己的快捷键了，美滋滋，下面的日子就是学习快速跳转，还有窗口切换相关的事情，再者就是Vim的快捷键训练

#### [使用 vim-pathogen 进行插件管理](https://www.cnblogs.com/gtarcoder/p/4632325.html)转载自农民伯伯

　　使用 vim 的插件管理器 pathogen 进行 vim 的插件管理。

1. pathogen 管理插件
　　 pathogen 让每个插件占有一个单独的目录，解决了文件分散的问题。安装完 pathogen 之后，只需要在～/.vim/ 目录下新建一个目录～/.vim/bundle/，并将要安装的所有插件放在～/.vim/bundle / 目录下即可以使用（直接在～/.vim/bundle 目录下 git clone xxx.git 即可)。如果要删除某个插件，只需要将～/.vim/bundle/ 目录下对应的插件目录删除即可。如果想保持某个插件为最新版本，直接从插 件的仓库 checkout 一份代码到 bundle 目录即可。

2. 安装 vim 的插件管理器 pathogen

从 github 上获得 pathogen，解压到～/.vim 目录下，将 pathogen 中的 autoload 目录拷贝到～/.vim  目录下。

$cd ~/.vim

$mkdir bundle &&  mkdir autoload && cd bundle

$git clone https://github.com/tpope/vim-pathogen.git

$cp -r  pathogen/autoload  ~/.vim

3. 在.vimrc 中设置 pathogen

在～/.vimrc 文件里，filetype plugin indent on 之前的任何地方，加入这句：call pathogen#infect () 

4. 安装新插件

例如 安装 NERDTree

例如，要下载安装 NERDTree 插件，只需要进入到～/.vim/bundle/ 目录，然后执行以下命令：

　　git clone http://github.com/scrooloose/nerdtree.git  

下载完成后，会看到～/.vim/bundle/ 目录下会多出一个新的目录：nerdtree

OK！NERDTree 插件已经安装完成了！可以看到这种方式比传统的 vim 插件安装方式简单多了！

而要卸载该插件也非常简单，只需要在～/.vim/bundle/ 目录下删除 nerdtree 目录即可，干净利落！

要更新该插件到最新版本，只需要进入到该目录～/.vim/bundle/nerdtree/，并执行以下命令：

　　git pull origin  

当然这种安装和更新插件的方法只适用于代码仓库支持 git 的方法。

对于无法用 git 下载的插件，就更新 bundle 里的那个以插件名为名的目录就好。

#### Vim-Go
到Go官网下载安装Go得安装包，然后在自己的`.zshrc`文件里面配置好环境变量
```
export PATH=$HOME/bin:/usr/local/go/bin:$PATH
```

在`init.vim`中添加
```
" Vim-GO
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
```

然后在`Vim`里面`:GoInstallB...`
如果提示`guru，依然提示 "could not find 'guru'. Run :GoInstallBinaries to fix it`

```
 go get   golang.org/x/tools/cmd/guru
 go build golang.org/x/tools/cmd/guru
 mv guru $(go env GOROOT)/bin
```
### Day04

- [Vim-surround](https://github.com/tpope/vim-surround)

快速加符号的插件

Normal mode
-----------
ds  - delete a surrounding
cs  - change a surrounding
ys  - add a surrounding
yS  - add a surrounding and place the surrounded text on a new line + indent it
yss - add a surrounding to the whole line
ySs - add a surrounding to the whole line, place it on a new line + indent it
ySS - same as ySs

Visual mode
-----------
s   - in visual mode, add a surrounding
S   - in visual mode, add a surrounding but place text on new line + indent it

Insert mode
-----------
<CTRL-s> - in insert mode, add a surrounding
<CTRL-s><CTRL-s> - in insert mode, add a new line + surrounding + indent
<CTRL-g>s - same as <CTRL-s>
<CTRL-g>S - same as <CTRL-s><CTRL-s>
示例
![](https://gitee.com/itgoyo/PicGoRes/raw/master/img/20200731134927.png)