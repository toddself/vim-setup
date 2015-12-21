syntax enable "sytnax processing
set tabstop=2 "visual spaces per TAB
set softtabstop=2 "spaces used when you hit tab
set shiftwidth=2 "reindent
set expandtab "tabs are spaces
set number "show line numbers
set showcmd "show command in bottom bar
set ruler "show cursor position
filetype indent on "load file-type specific indent files
set wildmenu "visual autocomplete
set lazyredraw "redraw only when needed
set showmatch "highlight matching parens
set incsearch "search as characters are entered
set hlsearch "highlight those matches
let mapleader="," " leader becomes a comma
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
set foldenable "enable folding
set foldlevelstart=99 "open most folds
set foldnestmax=10 " max fold nexting
"space open/closes folds
nnoremap <space> za
set foldmethod=indent "fold on indent level
" move vertically by lines on terminal
nnoremap j gj
nnoremap k gk

" show statusline
set laststatus=2

" airline settings
let g:airline_left_sep="|"
let g:airline_right_sep="|"


" highlight column 80
let &colorcolumn=join(range(81,999),",")
let &colorcolumn="80,".join(range(400,999),",")

" jk is escape
inoremap jk <esc>
" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

"save session
nnoremap <leader>s :mksession<CR>

call pathogen#infect() " use pathogen
colorscheme molokai
let g:molokai_original = 1

" open ag.vim
nnoremap <leader>a :Ag

"CtrlP settings
nnoremap <leader>P :CtrlP<CR>
let g:ctrlp_match_window = 'bottom,order:ttb'
let g:ctrlp_switch_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" syntastic settings
let g:syntastic_javascript_checkers = ['standard']
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_enable_highlighting=1
let g:syntastic_html_tidy_exec = 'tidy'
let g:syntastic_html_tidy_ignore_errors = [ '<a> escaping malformed URI reference', '<img> lacks "alt" attribute', 'trimming empty <span>', 'trimming empty <li>']
nnoremap :St :SyntasticToggleMode<CR>

if has("gui_running")
  set guifont=Hack:h12
endif
