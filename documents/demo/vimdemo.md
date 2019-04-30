##vimrc 
```
let mapleader=";"
inoremap <Leader>jk <esc>
set encoding=utf-8
filetype plugin on


nmap LB 0
nmap LE $

vnoremap <Leader>y "+y

nmap <Leader>p "+p

nmap <Leader>q :q<CR>

nmap <Leader>w :w<CR>

nmap <Leader>WQ :wa<CR>:q<CR>

nmap <Leader>Q :qa!<CR>

nnoremap nw <C-W><C-W>

nnoremap <Leader>lw <C-W>l

nnoremap <Leader>hw <C-W>h

nnoremap <Leader>kw <C-W>k

nnoremap <Leader>jw <C-W>j

nmap <Leader>M %


autocmd BufWritePost $MYVIMRC source $MYVIMRC



set incsearch

set ignorecase

set nocompatible

set wildmenu

filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin() 
Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-fswitch'
Plugin 'scrooloose/nerdtree'
Plugin 'fholgado/minibufexpl.vim'
Plugin 'majutsushi/tagbar'
Plugin 'vim-scripts/indexer.tar.gz'
Plugin 'vim-scripts/DfrankUtil'
Plugin 'vim-scripts/vimprj'
Plugin 'Valloric/YouCompleteMe'
call vundle#end() 
filetype plugin indent on


set background=dark
colorscheme default


set gcr=a:block-blinkon0

set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R

set guioptions-=m
set guioptions-=T

fun! ToggleFullscreen()
    call system("wmctrl -ir " . v:windowid . " -btoggle,fullscreen")
endf

map <silent> <F10> :call ToggleFullscreen()<CR>

autocmd VimEnter * call ToggleFullscreen()

set laststatus=2

set ruler

set number

set cursorline
set cursorcolumn

set hlsearch



set nowrap

syntax enable

syntax on
syntax keyword cppSTLtype initializer_list


filetype indent on

set expandtab

set tabstop=4

set shiftwidth=4

set softtabstop=4



"vim-indent-guides
"
"let g:indent_guides_enable_on_vim_startup=1
"
"let g:indent_guides_start_level=1
"
"let g:indent_guides_guide_size=1
"
"nmap <silent> <Leader>i <Plug>IndentGuidesToggle
"
"
"set foldmethod=indent
""set foldmethod=syntax

set nofoldenable


nmap <silent> <Leader>sw :FSHere<cr>



map <Leader>bl :MBEToggle<cr>
map <Leader>el :MBEbn<cr>
map <Leader>eh :MBEbp<cr>

nmap <Leader>fl :NERDTreeToggle<CR>
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'
let g:NERDTreeWinPos='left'
let g:NERDTreeSize=30
let g:NERDTreeShowLineNumbers=1
let g:NERDTreeHidden=0
autocmd vimenter * if !argc()|NERDTree|endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd vimenter * NERDTree



let tagbar_left=0 
nnoremap <Leader>ilt :TagbarToggle<CR> 
let tagbar_width=32 
let g:tagbar_compact=1
let g:tagbar_type_cpp = {
    \ 'kinds' : [
         \ 'c:classes:0:1',
         \ 'd:macros:0:1',
         \ 'e:enumerators:0:0', 
         \ 'f:functions:0:1',
         \ 'g:enumeration:0:1',
         \ 'l:local:0:1',
         \ 'm:members:0:1',
         \ 'n:namespaces:0:1',
         \ 'p:functions_prototypes:0:1',
         \ 's:structs:0:1',
         \ 't:typedefs:0:1',
         \ 'u:unions:0:1',
         \ 'v:global:0:1',
         \ 'x:external:0:1'
     \ ],
     \ 'sro'        : '::',
     \ 'kind2scope' : {
         \ 'g' : 'enum',
         \ 'n' : 'namespace',
         \ 'c' : 'class',
         \ 's' : 'struct',
         \ 'u' : 'union'
     \ },
     \ 'scope2kind' : {
         \ 'enum'      : 'g',
         \ 'namespace' : 'n',
         \ 'class'     : 'c',
         \ 'struct'    : 's',
         \ 'union'     : 'u'
     \ }
     \ }


let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --fields=+iaSl --extra=+q"




highlight Pmenu ctermfg=2 ctermbg=3 guifg=#005f87 guibg=#EEE8D5
highlight PmenuSel ctermfg=2 ctermbg=3 guifg=#AFD700 guibg=#106900
let g:ycm_complete_in_comments=1
let g:ycm_confirm_extra_conf=0
let g:ycm_collect_identifiers_from_tags_files=1
inoremap <leader>; <C-x><C-o>
set completeopt-=preview
let g:ycm_min_num_of_chars_for_completion=1
let g:ycm_cache_omnifunc=0
let g:ycm_seed_identifiers_with_syntax=1
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>

```

## 快捷键
```
let mapleader=";"
inoremap <Leader>jk <esc>
nmap LB 0
nmap LE $
vnoremap <Leader>y "+y
nmap <Leader>p "+p
nmap <Leader>q :q<CR>
nmap <Leader>w :w<CR>
nmap <Leader>WQ :wa<CR>:q<CR>
nmap <Leader>Q :qa!<CR>
nnoremap nw <C-W><C-W>
nnoremap <Leader>lw <C-W>l
nnoremap <Leader>hw <C-W>h
nnoremap <Leader>kw <C-W>k
nnoremap <Leader>jw <C-W>j
nmap <Leader>M %
map <silent> <F10> :call ToggleFullscreen()<CR>
"nmap <silent> <Leader>i <Plug>IndentGuidesToggle
nmap <silent> <Leader>sw :FSHere<cr>
map <Leader>bl :MBEToggle<cr>
map <Leader>el :MBEbn<cr>
map <Leader>eh :MBEbp<cr>
nmap <Leader>fl :NERDTreeToggle<CR>
nnoremap <Leader>ilt :TagbarToggle<CR> 
inoremap <leader>; <C-x><C-o>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>


```


## 构建docker  
├── Dockerfile  
├── vim_plugins_install.sh  
└── vimrc  

Dockerfile
```
From ubuntu:16.04
RUN apt-get update && apt-get install -y gdb git make g++ gcc build-essential cmake python3-dev ctags vim
RUN apt-get install -y clang

ADD ./vimrc /root/.vimrc
ADD ./vim_plugins_install.sh /root/vim_plugins_install.sh
RUN ["chmod", "+x", "/root/vim_plugins_install.sh"]
RUN /root/vim_plugins_install.sh
```

vim_plugins_install.sh
```
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
# 安装vim插件
vim -c PluginInstall -c q -c q

# 安装插件运行需要依赖的一些组件
#cd /root/.vim/bundle/YouCompleteMe/ && python3 install.py --clang-complete &&  python3 install.py --clangd-completer
cd /root/.vim/bundle/YouCompleteMe/ && python3 install.py --clang-complete
```

命令
```
构建镜像
docker build -t agui/demovim .
运行容器
docker run -it -d --name demovimtest --cap-add=SYS_PTRACE --security-opt seccomp=unconfined agui/demovim /bin/bash

docker run -it --name aguivim -d -v ~/agui/github/linux-network:/home/linux-network --cap-add=SYS_PTRACE --security-opt seccomp=unconfined agui/demovim /bin/bash
进入容器
docker exec -it demovimtest /bin/bash
 
vim调试项目
  git clone https://github.com/antirez/redis.git
  cd redis
  make   
``` 

## .ycm_extra_conf.py 

```
import os
import ycm_core

# These are the compilation flags that will be used in case there's no
# compilation database set (by default, one is not set).
# CHANGE THIS LIST OF FLAGS. YES, THIS IS THE DROID YOU HAVE BEEN LOOKING FOR.
flags = [
    '-Wall',
    '-Wextra',
    '-Werror',
    '-Wno-long-long',
    '-Wno-variadic-macros',
    '-fexceptions',
    # THIS IS IMPORTANT! Without a "-std=<something>" flag, clang won't know which
    # language to use when compiling headers. So it will guess. Badly. So C++
    # headers will be compiled as C headers. You don't want that so ALWAYS specify
    # a "-std=<something>".
    # For a C project, you would set this to something like 'c99' instead of
    # 'c++11'.
    '-std=c99',
    # ...and the same thing goes for the magic -x option which specifies the
    # language that the files to be compiled are written in. This is mostly
    # relevant for c++ headers.
    # For a C project, you would set this to 'c' instead of 'c++'.
    '-x', 'c',
    '-I', '/usr/include/clang/3.8/include',
    '-isystem', '/usr/local/include',
    '-isystem', '/usr/include',
]

# Set this to the absolute path to the folder (NOT the file!) containing the
# compile_commands.json file to use that instead of 'flags'. See here for
# more details: http://clang.llvm.org/docs/JSONCompilationDatabase.html
#
# Most projects will NOT need to set this to anything; you can just change the
# 'flags' list of compilation flags. Notice that YCM itself uses that approach.
compilation_database_folder = ''

if compilation_database_folder:
  database = ycm_core.CompilationDatabase( compilation_database_folder )
else:
  database = None


def DirectoryOfThisScript():
  return os.path.dirname( os.path.abspath( __file__ ) )


def MakeRelativePathsInFlagsAbsolute( flags, working_directory ):
  if not working_directory:
    return list( flags )
  new_flags = []
  make_next_absolute = False
  path_flags = [ '-isystem', '-I', '-iquote', '--sysroot=' ]
  for flag in flags:
    new_flag = flag

    if make_next_absolute:
      make_next_absolute = False
      if not flag.startswith( '/' ):
        new_flag = os.path.join( working_directory, flag )

    for path_flag in path_flags:
      if flag == path_flag:
        make_next_absolute = True
        break

      if flag.startswith( path_flag ):
        path = flag[ len( path_flag ): ]
        new_flag = path_flag + os.path.join( working_directory, path )
        break

    if new_flag:
      new_flags.append( new_flag )
  return new_flags


def FlagsForFile( filename ):
  if database:
    # Bear in mind that compilation_info.compiler_flags_ does NOT return a
    # python list, but a "list-like" StringVec object
    compilation_info = database.GetCompilationInfoForFile( filename )
    final_flags = MakeRelativePathsInFlagsAbsolute(
      compilation_info.compiler_flags_,
      compilation_info.compiler_working_dir_ )
  else:
    # relative_to = DirectoryOfThisScript()
    relative_to = os.path.dirname(os.path.abspath(filename))
    final_flags = MakeRelativePathsInFlagsAbsolute( flags, relative_to )

  return {
    'flags': final_flags,
    'do_cache': True
  }

```


## Todo
共享文件夹 c语言自动提示和补全 代码自动跳转 多文档编辑

## Reference
[YouCompleteMe](https://github.com/Valloric/YouCompleteMe)    
[use_vim_as_ide](https://github.com/yangyangwithgnu/use_vim_as_ide)      
[http://www.skywind.me/blog/archives/2084](http://www.skywind.me/blog/archives/2084)     
[http://vim.zhangjikai.com/%E6%8F%92%E4%BB%B6/vundle.html](http://vim.zhangjikai.com/%E6%8F%92%E4%BB%B6/vundle.html)



