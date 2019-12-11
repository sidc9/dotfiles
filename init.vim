
" > plugins
" ======================================================================================================
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'junegunn/vim-easy-align'                                " fetches https://github.com/junegunn/vim-easy-align
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }            " Go plugin

"Plug 'zchee/deoplete-go', { 'do': 'make'}                     " go plugin for deoplete
Plug 'vim-python/python-syntax'                               " python syntax highlighting
Plug 'airblade/vim-gitgutter'                                 " git
Plug 'scrooloose/nerdtree'                                    " file tree explorer
Plug 'scrooloose/nerdcommenter'                               " code comments
Plug 'ctrlpvim/ctrlp.vim'                                     " fuzzy file searcher
"Plug 'vim-airline/vim-airline'                                " Airline - improves the statusline
"Plug 'vim-airline/vim-airline-themes'                         " themes for Airline
"Plug 'tpope/vim-fugitive'                                     " git support (needed for Airline)
Plug 'tpope/vim-surround'                                     " surround text with symbols/tags/brackets
Plug 'jiangmiao/auto-pairs'                                   " manage bracket/parens pairs
Plug 'SirVer/ultisnips'                                       " snippet engine
Plug 'machakann/vim-highlightedyank'                          " highlight the yank area
Plug 'majutsushi/tagbar' 				      " display source code tags
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " code-completion framework

" colorschemes
Plug 'tomasiser/vim-code-dark'
Plug 'kaicataldo/material.vim'
Plug 'morhetz/gruvbox'
Plug 'fatih/molokai'

" Initialize plugin system
call plug#end()

" ======================================================================================================


" > appearance
" ======================================================================================================
"
set background=dark

"colorscheme material
"colorscheme codedark
"colorscheme gruvbox
colorscheme molokai
syntax on
hi Pmenu guibg=black gui=bold

"let g:gruvbox_contrast_dark='hard'

"let g:airline_theme='bubblegum'
"let g:airline_powerline_fonts=1
"set guifont=Ubuntu\ Mono\ derivative\ Powerline:h12

"if !exists('g:airline_symbols')
"    let g:airline_symbols = {}
"endif

"" unicode symbols
"let g:airline_left_sep = '»'
"let g:airline_left_sep = '▶'
"let g:airline_right_sep = '«'
"let g:airline_right_sep = '◀'
"let g:airline_symbols.crypt = '🔒'
"let g:airline_symbols.linenr = '☰'
"let g:airline_symbols.linenr = '␊'
"let g:airline_symbols.linenr = '␤'
"let g:airline_symbols.linenr = '¶'
"let g:airline_symbols.maxlinenr = ''
"let g:airline_symbols.maxlinenr = '㏑'
"let g:airline_symbols.branch = '⎇'
"let g:airline_symbols.paste = 'ρ'
"let g:airline_symbols.paste = 'Þ'
"let g:airline_symbols.paste = '∥'
"let g:airline_symbols.spell = 'Ꞩ'
"let g:airline_symbols.notexists = 'Ɇ'
"let g:airline_symbols.whitespace = 'Ξ'

"" powerline symbols
"let g:airline_left_sep = ''
"let g:airline_left_alt_sep = ''
"let g:airline_right_sep = ''
"let g:airline_right_alt_sep = ''
"let g:airline_symbols.branch = ''
"let g:airline_symbols.readonly = ''
"let g:airline_symbols.linenr = '☰'
"let g:airline_symbols.maxlinenr = ''

set cursorline
set lazyredraw

" > general
" ======================================================================================================
let mapleader=";"
" Autosave only when there is something to save. Always saving makes build
" watchers crazy
:au FocusLost * silent! wa

set autowrite " save file when :make of :GoBuild is called

" open files relative to the path of current file
map ,e :e <C-R>=expand("%:p:h") . "\\" <CR>
map ,t :tabe <C-R>=expand("%:p:h") . "\\" <CR>
map ,s :vsplit <C-R>=expand("%:p:h") . "\\" <CR>

" replace word under cursor
nnoremap <leader>* :%s/\<<c-r><c-w>\>//g<left><left>

nnoremap <leader>k :m-2<cr>==
nnoremap <leader>j :m+<cr>==
xnoremap <leader>k :m-2<cr>gv=gv
xnoremap <leader>j :m'>+<cr>gv=gv

" easier split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

set number relativenumber
set numberwidth=5
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" buffer manipulation
nnoremap <Leader><Leader> :b#<CR>
nnoremap ]b :bnext<cr>
nnoremap [b :bprevious<cr>

nnoremap <Leader>ws :w<bar>so%<CR>
nnoremap <Leader>w :w<CR>

set foldmethod=syntax
set foldlevel=2
set nofoldenable
set foldlevelstart=99

syntax on
set laststatus=2
set splitright
set splitbelow
set hlsearch
set ignorecase smartcase

set completeopt=longest,menuone
set completeopt+=noinsert
set completeopt+=noselect

autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4
autocmd Filetype go setlocal tabstop=4 shiftwidth=4 softtabstop=4
" ts - show existing tab with 4 spaces width
" sw - when indenting with '>', use 4 spaces width
" sts - control <tab> and <bs> keys to match tabstop
"
" control all other files
set shiftwidth=4

set undofile " maintain undo history between sessions
set undodir=~/.vim/undodir

nnoremap <leader><space> :nohlsearch<CR>
" ======================================================================================================

" easy align
" =========
" start interactive EasyAlign in visual mode (eg. vipga)
xmap ga <Plug>(EasyAlign)

" start interactive EasyAlign for a motion/text object (eg. gaip)
nmap ga <Plug>(EasyAlign)
" =========

let g:python3_host_prog = "C:/Users/Sidd/AppData/Local/Programs/Python/Python37/python.exe"

" deoplete
let g:deoplete#enable_at_startup = 1

" deoplete-go
"let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
"let g:deoplete#sources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
call deoplete#custom#option('omni_patterns', { 'go': '[^. *\t]\.\w*' })
"call deoplete#custom#option('auto_refresh_delay', 2)
"call deoplete#custom#option('num_processes', 5)

" <Enter> will simply select the highlighted item
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" use Ctrl+n and Ctrl+p to navigate autocomplete menu
inoremap <expr> <C-n> pumvisible() ? '<C-n>' : '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

" vim-go settings
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_auto_sameids = 1
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 0

" open alternate (test file) files easily
" 	:A = replace current buffer
" 	:AV = vertical split
" 	:AS = horizontal split
" 	:AT = new tab
autocmd Filetype go command! -bang A call go#alternate#Switch(<bang>0, 'edit') 
autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
autocmd Filetype go command! -bang AS call go#alternate#Switch(<bang>0, 'split')
autocmd Filetype go command! -bang AT call go#alternate#Switch(<bang>0, 'tabe')

autocmd Filetype go nmap <leader>i <Plug>(go-info)

" python highlighting settings
let g:python_highlight_all = 1

" tagbar settings
nmap <leader>tt :TagbarToggle<CR>

" > nerdtree settings
" ======================================================================================================

" quick toggle (Ctrl+n)
map <C-n> :NERDTreeToggle<CR>

" file highlighting
function! NERDTreeHighlightFile(extension, fg, bg, guifg, guibg)
 exec 'autocmd filetype nerdtree highlight ' . a:extension .' ctermbg='. a:bg .' ctermfg='. a:fg .' guibg='. a:guibg .' guifg='. a:guifg
 exec 'autocmd filetype nerdtree syn match ' . a:extension .' #^\s\+.*'. a:extension .'$#'
endfunction

" note: for Neovim, change 'guifg' term (4th param)
call NERDTreeHighlightFile('py', 'green', 'none', 'green', '#151515')
call NERDTreeHighlightFile('pyc', 'grey', 'none', 'grey', '#151515')
call NERDTreeHighlightFile('go', 'blue', 'none', 'DeepSkyBlue', '#151515')
call NERDTreeHighlightFile('Makefile', 'yellow', 'none', 'Gold', '#151515')
call NERDTreeHighlightFile('ini', 'yellow', 'none', 'LightYellow', '#151515')
call NERDTreeHighlightFile('yml', 'yellow', 'none', 'LightYellow', '#151515')
call NERDTreeHighlightFile('config', 'yellow', 'none', 'LightYellow', '#151515')
call NERDTreeHighlightFile('conf', 'yellow', 'none', 'LightYellow', '#151515')
call NERDTreeHighlightFile('json', 'yellow', 'none', 'LightYellow', '#151515')
call NERDTreeHighlightFile('exe', 'green', 'none', 'LimeGreen', '#151515')
call NERDTreeHighlightFile('html', 'yellow', 'none', 'yellow', '#151515')
call NERDTreeHighlightFile('styl', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('css', 'cyan', 'none', 'cyan', '#151515')
call NERDTreeHighlightFile('coffee', 'Red', 'none', 'red', '#151515')
call NERDTreeHighlightFile('js', 'Red', 'none', '#ffa500', '#151515')
call NERDTreeHighlightFile('php', 'Magenta', 'none', '#ff00ff', '#151515')
call NERDTreeHighlightFile('md', 'white', 'none', 'wheat', '#151515')

hi NERDTreeOpenable ctermfg=green guifg=#00FF00
hi NERDTreeClosable ctermfg=green guifg=#FF0000
hi Directory guifg=LemonChiffon ctermfg=white
" ======================================================================================================

" autosave and autoreload sessions
" ====================
let sessionFile = expand("~/session.vim")

fu! SaveSession()
    NERDTreeClose
    execute 'mksession! ' . g:sessionFile
endfunction

fu! RestoreSession()
    if filereadable(g:sessionFile)
	execute 'so ' . g:sessionFile
	if bufexists(1)
	    for l in range(1, bufnr('$'))
		if bufwinnr(l) == -1
		    exec 'sbuffer ' . l
		endif
	    endfor
	endif
    else
	echom "no session file"
    endif
endfunction

autocmd VimLeave * call SaveSession()
autocmd VimEnter * nested call RestoreSession()
" ====================

let g:UltiSnipsSnippetDirectories=['UltiSnips', 'gosnippets/UltiSnips', $HOME.'/.vim/UltiSnips']

