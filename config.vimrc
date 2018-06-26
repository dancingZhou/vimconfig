" 项目
"source ~/learn/layout/vim70.vim
"viminfo ~/learn/layout/vim70.viminfo
"mksession! ~/learn/layout/vim70.vim 
"wviminfo! ~/learn/layout/vim70.viminfo
" 结束
set nocompatible              " 去除VI兼容模式，兼容模式会去掉vim的扩展
filetype plugin indent on
" 失去焦点自动保存
autocmd BufLeave,FocusLost * silent! wall
set t_Co=256
" 上下最少保留的行数
set scrolloff=5
set number "设置显示行号
set ts=2 "(注：ts是tabstop的缩写，设TAB宽4个空格)
set expandtab "expandtab是空格 noexpandtab是tab
" :set softtabstop=2 “ 退格键的宽度
set shiftwidth=2 " 每一级缩颈
set smartindent
set smarttab
set autoindent

set background=dark " 或者等于 light
syntax enable
" 设置leader为;
let mapleader=';'

map <leader>h :bpre<CR>
map <leader>l :bnext<CR>
map <leader>f :bfirst<CR>
map <leader>a :blast<CR>
"禁止生成临时文件
set nobackup
set noswapfile
" 搜索文件忽略大小写
set ignorecase

map <leader>n :e#<CR>

" 编码问题
set encoding=utf8
set fileencodings=utf8,gb18030,gbk
set fileencoding=utf8
"set guifont=Monaco:h13 "设置字号
"set guifont=Monospace:h16 "设置字号
"set guifont = Monaco:h14
set guifont=Source\ Code\ Pro\ for\ Powerline:h14

" 设置在任何模式下ctrl + s 可以保存文件
nmap <C-S> :update<CR>
vmap <C-S> <C-C>:update<CR>
imap <C-S> <C-O>:update<CR>

map <C-L> <C-W><C-L>
map <C-H> <C-W><C-H>
map <C-K> <C-W><C-K>
map <C-J> <C-W><C-J>
" 高亮当前列
set cursorcolumn 
" 高亮当前行
set cursorline 

" 加载配置文件
map <Leader>ss :source ~/.vimrc<CR>
" 编辑配置文件
map <Leader>ee :e ~/.vimrc<CR>
" 自动加载配置文件
autocmd! bufwritepost .vimrc source ~/.vimrc
"自动加载配置文件
"autocmd bufwritepost .vimrc source $MYVIMRC  
"
" 下面是插件
set rtp+=~/.vim/bundle/Vundle.vim " 设置包括vundle和初始化相关的runtime path
call vundle#begin()               " 另一种选择, 指定一个vundle安装插件的路径 call vundle#begin('~/some/path/here')
"Plugin 'https://github.com/Chiel92/vim-autoformat.git'
Plugin 'mhinz/vim-startify'
Plugin 'Chiel92/vim-autoformat'
Plugin 'vim-airline/vim-airline' 
Plugin 'vim-airline/vim-airline-themes'
Plugin 'powerline/fonts'
Plugin 'w0rp/ale' " 语法检查"
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'ctrlp.vim'
Plugin 'Emmet.vim'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mxw/vim-jsx'
Plugin 'scrooloose/nerdcommenter'
Plugin 'VundleVim/Vundle.vim'
Plugin 'https://github.com/jiangmiao/auto-pairs.git'
Plugin 'https://github.com/altercation/vim-colors-solarized.git'
Plugin 'tpope/vim-commentary'
Plugin 'Valloric/YouCompleteMe'
Plugin 'chemzqm/wxapp.vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'tpope/vim-surround' " 包裹字符
Plugin 'tpope/vim-repeat' " 让包裹字符的快捷键变为 .
Plugin 'easymotion/vim-easymotion' " 快速移动

Plugin 'morhetz/gruvbox'
Plugin 'pangloss/vim-javascript'
Plugin 'joshdick/onedark.vim'
Plugin 'taglist.vim'
" Plugin 'marijnh/tern_for_vim'
Plugin 'shawncplus/phpcomplete.vim'
call vundle#end()
" 设置文件类型为typescript
autocmd BufNewFile,BufRead *.d.ts,*.ts,*.tsx setlocal filetype=typescript
"autocmd BufNewFile,BufRead *.tsx setlocal filetype=typescript
"autocmd BufNewFile,BufRead *.d.ts setlocal filetype=typescript

" easymotion
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)
" easymotion end

"let g:tlist_show_one_file = 1
let Tlist_Exit_Onlywindow = 1
let Tlist_Close_On_Select = 1
let Tlist_File_Fold_Auto_Close = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Use_Right_Window = 1
"map <Leader>oo :TlistToggle <CR>
map <Leader>t :Tlist <CR>
"
" let g:autoformat_verbosemode=1
" 代码风格检查'prettier-standard',
noremap <F3> :Autoformat<CR>
let g:syntastic_javascript_checkers = ['standard']
let g:ale_fixers = {
\   'javascript': ['standard'],
\}
"let g:ale_completion_enabled = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '⚡'
" 关闭语法检查
nmap <Leader>a :ALEToggle<CR>
"普通模式下，sp前往上一个错误或警告，sn前往下一个错误或警告
nmap sp <Plug>(ale_previous_wrap)
nmap sn <Plug>(ale_next_wrap)
" let g:ale_fix_on_save = 1
" 主题配色 
colorscheme gruvbox
"if has("gui")
  "colorscheme onedark
"endif
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'
"let g:airline#extensions#tabline#formatter = 'default'
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
" powerline
"let g:Powerline_symbols = 'unicode' " 值为fancy中文乱码

"let g:airline_theme='gruvbox'
"set laststatus=2
" let g:gruvbox_contrast = 'hard'
" NERDTree.vim
"autocmd vimenter * NERDTree " 自动打开
"map <Leader>n <plug>NERDTreeTabsToggle<CR> "设置在新标签中共享nedertree
" autocmd StdinReadPre * let s:std_in=1
let g:nerdtree_tabs_open_on_gui_startup = 0
let NERDTreeShowBookmarks=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") &&b:NERDTreeType == "primary") | q | endif
map <leader>n :NERDTreeToggle<CR>
map <leader>v :NERDTreeFind<CR>
let g:NERDTreeChDirMode = 2 
" 是否显示隐藏文件
"let NERDTreeShowHidden=1
" 在终端启动vim时，共享NERDTree
let g:nerdtree_tabs_open_on_console_startup=1
let NERDTreeIgnore=['\.pyc','\~$','\.swp']
"let g:nerdtree_tabs_smart_startup_focus = 2
let NERDTreeMouseMode=2
let g:NERDTreeWinSize=20

" ymc自动补全的设置
let g:ycm_min_num_of_chars_for_completion = 3 
let g:ycm_autoclose_preview_window_after_completion=1
let g:ycm_complete_in_comments = 1
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
" 比较喜欢用tab来选择补全...
function! MyTabFunction ()
    let line = getline('.')
    let substrin = strpart(line, col('.')-2, 1)
    let substr = matchstr(substrin, "[ \t]$")
    if strlen(substrin) == 0 || strlen(substr) == 1
        return "\<tab>"
    endif
    return pumvisible() ? "\<c-n>" : "\<c-x>\<c-o>"
endfunction

inoremap <tab> <c-r>=MyTabFunction()<cr>

"emmet的设置
let g:user_emmet_expandabbr_key = '<c-e>'

" CtrlP Start
let g:ctrlp_working_path_mode = 'rw'
"<Leader>p搜索当前目录下文件
let g:ctrlp_map = '<Leader>p'
"let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
"<Leader>f搜索MRU文件
nmap <Leader>f :CtrlPMRUFiles<CR>
"<Leader>b显示缓冲区文件，并可通过序号进行跳转
nmap <Leader>b :CtrlPBuffer<CR>
"设置搜索时忽略的文件
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn|rvm)|node_modules$',
    \ 'file': '\v\.(exe|so|dll|zip|tar|tar.gz|pyc)$',
    \ }
" let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_bottom = 1
"修改QuickFix窗口显示的最大条目数
let g:ctrlp_max_height = 15
let g:ctrlp_match_window_reversed = 0
"设置MRU最大条目数为500
let g:ctrlp_mruf_max = 500
let g:ctrlp_follow_symlinks = 1
"默认使用全路径搜索，置1后按文件名搜索，准确率会有所提高，可以用<C-d>进行切换
let g:ctrlp_by_filename = 0