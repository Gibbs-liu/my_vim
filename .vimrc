set nocompatible              " be iMproved, required

filetype off                  " required
filetype plugin on

runtime macros/matchit.vim


" 启用vundle来管理vim插件
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" 安装插件写在这之后

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'vim-airline/vim-airline'
Plugin 'scrooloose/syntastic' 
Plugin 'frazrepo/vim-rainbow'
Plugin 'scrooloose/nerdcommenter'
Plugin 'yegappan/taglist'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'tell-k/vim-autopep8'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'Raimondi/delimitMate'
Plugin 'inkarkat/vim-mark'
Plugin 'inkarkat/vim-ingo-library'
Plugin 'jupyter-vim/jupyter-vim'
Plugin 'sillybun/vim-repl'


" 安装插件写在这之前
call vundle#end()            " required
filetype plugin on    " required

let g:jedi#force_py_version=3


" 常用命令
" :PluginList       - 查看已经安装的插件
" :PluginInstall    - 安装插件
" :PluginUpdate     - 更新插件
" :PluginSearch     - 搜索插件，例如 :PluginSearch xml就能搜到xml相关的插件
" :PluginClean      - 删除插件，把安装插件对应行删除，然后执行这个命令即可

" h: vundle         - 获取帮助

" vundle的配置到此结束，下面是你自己的配置

let g:jedi#auto_vim_configuration = 0

let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_confirm_extra_conf = 0

set number

set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

" colo delek

set cursorcolumn " 高亮当前列
set cursorline  " 高亮当前行

set mouse=a  " 鼠标点击之后可以进入预览窗口看补全代码的文档


" nerdTree的设置
map <F3> :NERDTreeMirror<CR>
map <F3> :NERDTreeToggle<CR>

" syntastic setting
let g:syntastic_error_symbol='>>'
let g:syntastic_warning_symbol='>'
let g:syntastic_check_on_open=1
let g:syntastic_check_on_wq=0
let g:syntastic_enable_hithlighting=1
let g:syntastic_python_checkers=['pyflakes'] " 使用pyflakes, 速度比pylint快


syntax on
set autoindent


" 使用彩虹括号
" au FileType c,cpp,objc,objcpp call rainbow#load()
let g:rainbow_active=1 " 全局使用彩虹括号

nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR> " 删除多余空格


" nerdcommenter 配置
" <leader>cc 自动注释
" <leader>cu 自动解除注释
let g:NERDSpaceDelims=1 " 注释的时候自动加个空格


" 查找高亮
set hlsearch

let Tlist_Show_One_File=1    " 不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow=1  " 如果taglist是最后一个窗口，退出vim
let Tlist_Ctags_Cmd="/opt/homebrew/bin/ctags"

let g:pymode_python='python3'
autocmd VimEnter *.py python3 sys.path.append(".")
autocmd BufWritePost *.py call Flake8()

" 使用flake8作为python语法检查器

let g:syntastic_python_flake8_args='--ignore=E501,E225'

let g:autopep8_aggressive=2

let g:jedi#force_py_version=3
let g:gedi#smart_auto_mappings=0

let g:ycm_filetype_specific_completion_to_disable={'python':1}
set smartindent

let g:indent_guides_enable_on_vim_startup=1
set background=dark
hi IndentGuidesOdd ctermbg=grey

colorscheme default 
"
"
filetype indent on
let g:python_pep8_indent_multiline_string=-2
let g:python_pep8_indent_hang_closing=1

set ignorecase
set smartcase

set incsearch


" 关于搜索和高亮的设置
" 当光标一段时间保持不动了，就禁用高亮
autocmd cursorhold * set nohlsearch
" 当输入查找命令时，再启用高亮
noremap n :set hlsearch<cr>n
noremap N :set hlsearch<cr>N
noremap / :set hlsearch<cr>/
noremap ? :set hlsearch<cr>?
" noremap * *:set hlsearch<cr>


"上述配置指定 Search
"结果的前景色（foreground）为黑色，背景色（background）为灰色；
"渐进搜索的前景色为黑色，背景色为黄色；光标处的字符加下划线。
highlight Search ctermbg=yellow ctermfg=black
highlight IncSearch ctermbg=black ctermfg=yellow
highlight MatchParen cterm=underline ctermbg=NONE ctermfg=NONE

" 保存历史
set history=200

" vim_jupyter
" let g:vim_virtualenv_path = '/Users/liuhaoyu/miniforge3/envs/tf/'
" if exists('g:vim_virtualenv_path')
    " pythonx import os; import vim
    " pythonx activate_this = os.path.join(vim.eval('g:vim_virtualenv_path'), 'bin/activate_this.py')
    " pythonx with open(activate_this) as f: exec(f.read(), {'__file__': activate_this})
" endif

" vim repl
" websit: https://github.com/sillybun/vim-repl
" 这是在vim里面使用repl的插件，感觉比pycharm的还好用。
" 使用方法大概是
"   先用下面的命令打开repl
nnoremap <leader>z :REPLToggle<CR>
"   然后<leader>w可以运行一行或者一个代码块d
"   三种方式：  1.光标在行首，运行该行
"               2.选中若干行，运行若干行
"               3.选中单词，打印该单词
let g:repl_position=0
let g:repl_ipython_version = '7.26'
let g:repl_program={'python':['ipython'], 'default':['zsh']}
" If g:repl_auto_sends is defined, once user sends a line starts with any
" pattern contained in the list, whole block will be send automatically.
let g:repl_auto_sends = ['class ', 'def ', 'for ', 'if ', 'while ', 'with ', 'async def', '@', 'try']
let g:repl_python_auto_send_unfinish_line = 1
let g:repl_python_auto_import = 1
let g:repl_python_automerge=1
let g:repl_output_copy_to_register = "t"
nnoremap <leader>h :REPLHide<CR>


