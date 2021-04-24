"*****************************************************************************
" PERSONAL VIMRC
"*****************************************************************************
if &compatible
  set nocompatible
endif

filetype off
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"" List of plugins
Plugin 'lifepillar/vim-solarized8'
Plugin 'raimondi/delimitmate'
Plugin 'dense-analysis/ale'
Plugin 'sheerun/vim-polyglot'
Plugin 'preservim/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'airblade/vim-gitgutter'
Plugin 'valloric/youcompleteme'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mg979/vim-visual-multi'
Plugin 'bling/vim-airline'
Plugin 'tomtom/tcomment_vim'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'joaohkfaria/vim-jest-snippets'
Plugin 'mileszs/ack.vim'
Plugin 'ap/vim-css-color'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tibabit/vim-templates'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"*****************************************************************************
"" Basic Setup
"*****************************************************************************"
"" Encoding
set encoding=UTF-8
set fileencoding=UTF-8
set fileencodings=UTF-8

"" Fix backspace indent
set backspace=indent,eol,start

"" Tabs. May be overriten by autocmd rules
set softtabstop=2
set shiftwidth=2
set expandtab
set smartindent
set smarttab
set autoindent
execute ":silent tab all"

"" Enable hidden buffers
set hidden

"" History
set history=100

" Faster refraw
set ttyfast

" Mouse activated in Normal and Visual Mode
set mouse=nv

"" Set to auto read when a file is changed from the outside
set autoread
au FocusGained,BufEnter * checktime

" Better command-line completion
set wildmenu

"" Searching
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
set matchtime=3

"" Directories for swp files
set nobackup
set noswapfile
set nowb

"" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

set updatetime=1000

"" Prevent lag when hitting escape
set ttimeoutlen=0
set timeoutlen=1000
au InsertEnter * set timeout
au InsertLeave * set notimeout

"" Persistant undo
set undodir=~/.vim/tmp_dirs/undodir
set undofile

"*****************************************************************************
"" Visual Settings
"*****************************************************************************
" UI
set title
set titleold="Terminal"
syntax enable
set ruler
set showcmd
set number
set linebreak
set tw=500
set shortmess+=I " No intro when starting Vim
set virtualedit=onemore " Allow the cursor to move just past the end of the line
set noshowmode " Don't display the current mode
set iskeyword+=\- " Complete words containing a dash

"" Fonts
set guifont=DroidSansMono\ Nerd\ Font\ 11

" Highligt the cursor line
set cursorline
let &showbreak="\u21aa " " Show a left arrow when wrapping text

" Theme
if has('gui_running')
    set background=light
else
    set background=dark
endif
colorscheme solarized8
let g:solarized_termcolors=256

" Scroll
set scrolloff=10 " Always keep 10 lines after or before when scrolling
set sidescrolloff=5 " Always keep 5 lines after or before when side scrolling

" Splits
set splitbelow
set splitright

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"*****************************************************************************
"" Plugins Configuration
"*****************************************************************************
"" Airline
let g:airline_powerline_fonts = 1

"" ALE
let g:ale_fixers = {'javascript': ['prettier', 'eslint'], 'vue': ['prettier', 'eslint']}
let g:ale_fix_on_save = 1

autocmd BufRead,BufNewFile *.vue setfiletype html

"" NERDTree
" Show hidden files
let NERDTreeShowHidden=1
" Open a NERDTree automatically when vim starts up if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"" CtrlP
" Define working path
let g:ctrlp_working_path_mode = 'ra'
" Exclude specific files and directories
set wildignore+=*/tmp/*,*.so,*.swp,*.zip

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'some_bad_symbolic_links',
      \ }
" Ignore files in .gitignore
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

"" Vim Visual Multi
let g:VM_maps = {}
let g:VM_maps['Find Under']         = '<C-d>'
let g:VM_maps['Find Subword Under'] = '<C-d>'

"" UltiSnips
let g:ulti_expand_or_jump_res = 0
function ExpandSnippetOrCarriageReturn()
    let snippet = UltiSnips#ExpandSnippetOrJump()
    if g:ulti_expand_or_jump_res > 0
        return snippet
    else
        return "\<CR>"
    endif
endfunction
inoremap <expr> <CR> pumvisible() ? "<C-R>=ExpandSnippetOrCarriageReturn()<CR>" : "\<CR>"
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

"" Ack
" Use ag
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

"" Templates
let g:tmpl_search_paths = ['~/Templates']
let g:tmpl_auto_initialize = 0

"*****************************************************************************
"" Mappings
"*****************************************************************************
imap cll console.log()<Esc>==f(a

function! CreateShortcut(keys, cmd, where, ...)
  let keys = "<" . a:keys . ">"
  if a:where =~ "i"
    let i = (index(a:000,"noTrailingIInInsert") > -1) ? "" : "i"
    let e = (index(a:000,"noLeadingEscInInsert") > -1) ? "" : "<esc>"
    execute "imap " . keys . " " . e .  a:cmd . i
  endif
  if a:where =~ "n"
    execute "nmap " . keys . " " . a:cmd
  endif
  if a:where =~ "v"
    let k = (index(a:000,"restoreSelectionAfter") > -1) ? "gv" : ""
    let c = a:cmd
    if index(a:000,"cmdInVisual") > -1
      let c = ":<C-u>" . strpart(a:cmd,1)
    endif
    execute "vmap " . keys . " " . c . k
  endif
endfunction

"*****************************************************************************
"" Shortcuts
"*****************************************************************************

" Usefull shortcuts to enter insert mode
nnoremap <CR> i<CR>
nnoremap <Backspace> i<Backspace>
nnoremap <Space> i<Space>

" Home - Go To Begin
call CreateShortcut("Home", "gg", "inv")

" End - Go To End
call CreateShortcut("End", "G", "inv")

" Ctrl A - Begin Line
call CreateShortcut("C-a", "0", "i")
call CreateShortcut("C-a", "0i", "nv")

"Ctrl C - Close current tab
call CreateShortcut("C-c", ":tabclose<CR>", "inv")

" Ctrl E - End Line
call CreateShortcut("C-e", "$l", "i")
call CreateShortcut("C-e", "$li", "nv")

" Ctrl F - Find
call CreateShortcut("C-f", "/", "in", "noTrailingIInInsert")

" Ctrl H - Search and Replace
call CreateShortcut("C-h", ":%s/", "in", "noTrailingIInInsert")

"Ctrl K - Search in files with ag
call CreateShortcut("C-k", ":Ack! ", "in", "noTrailingIInInsert")

" Ctrl L - Delete all lines
call CreateShortcut("C-l", "ggdG", "in")

" Ctrl N - Open/Close NerdTree
call CreateShortcut("C-n", ":NERDTreeToggle<CR>", "inv")

" Ctrl Q - Quit
call CreateShortcut("C-q", ":qa!<CR>", "inv", "cmdInVisual")

" Ctrl R - Redo
call CreateShortcut("C-r", "<C-r>", "in")

" Ctrl S - Save
nnoremap <c-s> :w<CR>
inoremap <c-s> <Esc>:w<CR>a
vnoremap <c-s> <Esc>:w<CR>

" Ctrl T - New tab
call CreateShortcut("C-t", ":tabnew<CR>i", "inv", "noTrailingIInInsert", "cmdInVisual")

" Ctrl Z - Undo
call CreateShortcut("C-z", "u", "in")

" Pageup - Move up Line
call CreateShortcut("PageUp", ":m-2<CR>", "inv", "restoreSelectionAfter")

" Pagedown - Move down Line
call CreateShortcut("PageDown", ":m+<CR>", "in")
call CreateShortcut("PageDown", ":m'>+<CR>", "v", "restoreSelectionAfter")

" Alt Right - Next tab
call CreateShortcut("C-Right", "gt", "inv")

" Alt Left - Previous tab
call CreateShortcut("C-Left", "gT", "inv")

" F3 - Line numbers toggle
call CreateShortcut("f3",":set nonumber!<CR>", "in")

" F6 - Toggle color column at 80th char
function! ToggleColorColumn()
  if &colorcolumn != 0
    windo let &colorcolumn = 0
  else
    windo let &colorcolumn = 80
  endif
endfunction
call CreateShortcut("f6",":call ToggleColorColumn()<CR>", "inv")

"" Abbreviations
:ab unifai Unifai
:iab lorem Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer nec odio. Praesent libero. Sed cursus ante dapibus diam. Sed nisi. Nulla quis sem at nibh elementum imperdiet. Duis sagittis ipsum. Praesent mauris. Fusce nec tellus sed augue semper porta. Mauris massa. Vestibulum lacinia arcu eget nulla.<cr><cr>Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Curabitur sodales ligula in libero. Sed dignissim lacinia nunc. Curabitur tortor. Pellentesque nibh. Aenean quam. In scelerisque sem at dolor. Maecenas mattis. Sed convallis tristique sem. Proin ut ligula vel nunc egestas porttitor. Morbi lectus risus, iaculis vel, suscipit quis, luctus non, massa. Fusce ac turpis quis ligula lacinia aliquet. Mauris ipsum. Nulla metus metus, ullamcorper vel, tincidunt sed, euismod in, nibh.<cr><cr>Quisque volutpat condimentum velit. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Nam nec ante. Sed lacinia, urna non tincidunt mattis, tortor neque adipiscing diam, a cursus ipsum ante quis turpis. Nulla facilisi. Ut fringilla. Suspendisse potenti. Nunc feugiat mi a tellus consequat imperdiet. Vestibulum sapien. Proin quam. Etiam ultrices. Suspendisse in justo eu magna luctus suscipit. Sed lectus.
