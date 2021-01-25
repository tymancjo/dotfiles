"This is my very first vim config 

    if exists('g:vscode')
    " VSCode extension
    
    "Key maps for line moving
    nnoremap <A-j> :m .+1<CR>==
    nnoremap <A-k> :m .-2<CR>==
    inoremap <A-j> <Esc>:m .+1<CR>==gi
    inoremap <A-k> <Esc>:m .-2<CR>==gi
    vnoremap <A-j> :m '>+1<CR>gv=gv
    vnoremap <A-k> :m '<-2<CR>gv=gv

    set number relativenumber
    set colorcolumn=80

    else
    " ordinary neovim
    set runtimepath^=~/.vim runtimepath+=~/.vim/after
    let &packpath = &runtimepath
    source ~/.vimrc

    call plug#begin(stdpath('data').'/plugged')
    
    Plug 'arcticicestudio/nord-vim'
    Plug 'davidhalter/jedi-vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'scrooloose/nerdtree'
    Plug 'preservim/nerdcommenter'
    Plug 'ervandew/supertab'
    Plug 'joshdick/onedark.vim'
    Plug 'dracula/vim', { 'as': 'dracula' } 
    Plug 'altercation/vim-colors-solarized'
    Plug 'vim-airline/vim-airline' 
    Plug 'vim-airline/vim-airline-themes'
    Plug 'ryanoasis/vim-devicons'
    Plug 'nathanaelkane/vim-indent-guides'
    Plug 'vim-python/python-syntax'
    Plug 'NLKNguyen/papercolor-theme'
    Plug 'chrisbra/Colorizer'
    Plug 'tpope/vim-surround'
    Plug 'junegunn/goyo.vim'
    " Markdown live preview
    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
    " C++ autocomplete...
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    "Plug 'ap/vim-css-color'
    "Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}
    Plug 'godlygeek/tabular'
    Plug 'plasticboy/vim-markdown'
    Plug 'dhruvasagar/vim-table-mode'
    Plug 'vim-scripts/DrawIt'


    call plug#end()
    syntax enable
    syntax on  
    
    let g:python_highlight_all = 1 

    " Markdown live preview setup
    let g:mkdp_refresh_slow = 0
    " specify browser to open preview page
    " default: ''
    let g:mkdp_browser = 'surf'

    "some sets as found online
    set encoding=utf-8
    set number relativenumber
    set noswapfile
    set scrolloff=7
    set backspace=indent,eol,start
    set hidden

    set tabstop=4
    set softtabstop=4
    set shiftwidth=4
    set expandtab
    set autoindent
    set fileformat=unix

    set cursorline
    set colorcolumn=80

    set background=dark
    "colorscheme onedark
    "colorscheme nord
    "colorscheme dracula 
    colorscheme solarized 
    "colorscheme PaperColor 
    " making the background transparent
    hi Normal ctermbg=NONE guibg=NONE

    " keymap for leader
    let mapleader = ' '

    "keymaps for exit from edits
    imap vv <Esc>
    nnoremap vv <Esc>
    vnoremap vv <Esc>
    onoremap vv <Esc>
    inoremap vv <Esc>
    
    "Key maps for line moving
    nnoremap <A-j> :m .+1<CR>==
    nnoremap <A-k> :m .-2<CR>==
    inoremap <A-j> <Esc>:m .+1<CR>==gi
    inoremap <A-k> <Esc>:m .-2<CR>==gi
    vnoremap <A-j> :m '>+1<CR>gv=gv
    vnoremap <A-k> :m '<-2<CR>gv=gv

    " NERDCommenter
    nmap <C-_> <Plug>NERDCommenterToggle
    vmap <C-_> <Plug>NERDCommenterToggle<CR>gv
    
    let NERDTreeQuitOnOpen=1
    let g:NERDTreeMinimalUI=1
    nmap <F2> :NERDTreeToggle<CR>
    nmap <F3> :browse oldfiles<CR>

    " keybinging for color CSSlike display
    nmap <F4> :ColorToggle<CR>

    " Indenting marking
    let g:indent_guides_enable_on_vim_startup = 1
    let g:indent_guides_guide_size = 1
    let g:indent_guides_color_change_percent = 5
    let g:indent_guides_start_level = 2
    set ts=4 sw=4 et 

    " Spell check stuff
    set spelllang=pl,en_us
    set spell
    nmap <F7> :set spell!<CR>

    " Goyo mode detection and setup
    function! s:goyo_enter()
      if executable('tmux') && strlen($TMUX)
        silent !tmux set status off
        silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
      endif
      set noshowmode
      set noshowcmd
      set scrolloff=999
      set cursorline
      " ...
    endfunction

    function! s:goyo_leave()
      if executable('tmux') && strlen($TMUX)
        silent !tmux set status on
        silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
      endif
      set showmode
      set showcmd
      set scrolloff=5
      " ...
      " making the background transparent
      hi Normal ctermbg=NONE guibg=NONE
      set cursorline
    endfunction

    autocmd! User GoyoEnter nested call <SID>goyo_enter()
    autocmd! User GoyoLeave nested call <SID>goyo_leave()    
endif
