" Leader
let mapleader = " "

set backspace=2   " Backspace deletes like most programs in insert mode
set nobackup
set nowritebackup
set noswapfile    " http://robots.thoughtbot.com/post/18739402579/global-gitignore#comment-458413287
set history=50
set ruler         " show the cursor position all the time
set showcmd       " display incomplete commands
set incsearch     " do incremental searching
set ignorecase    " case insensitive searching
set smartcase     " case-sensitive if expresson contains a capital letter
set showmatch     " show matching braces
set laststatus=2  " Always display the status line
set autowrite     " Automatically :write before running commands

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if (&t_Co > 2 || has("gui_running")) && !exists("syntax_on")
  syntax on
endif

if filereadable(expand("~/.vimrc.bundles"))
  source ~/.vimrc.bundles
endif

" Load matchit.vim, but only if the user hasn't installed a newer version.
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif

filetype plugin indent on

augroup vimrcEx
  autocmd!

  " When editing a file, always jump to the last known cursor position.
  " Don't do it for commit messages, when the position is invalid, or when
  " inside an event handler (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  " Set syntax highlighting for specific file types
  autocmd BufRead,BufNewFile Appraisals set filetype=ruby
  autocmd BufRead,BufNewFile *.md set filetype=markdown
  autocmd BufRead,BufNewFile .{eslint}rc set filetype=json
  autocmd BufRead,BufNewFile *.pcss set filetype=scss
  autocmd BufRead,BufNewFile *.morph set filetype=javascript
augroup END

" When the type of shell script is /bin/sh, assume a POSIX-compatible
" shell for syntax highlighting purposes.
let g:is_posix = 1

" Softtabs, 2 spaces
set tabstop=2
set shiftwidth=2
set shiftround
set expandtab

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" Use one space, not two, after punctuation.
set nojoinspaces

set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/log/*
set wildignore+=**/node_modules
set wildignore+=*/vendor/bundle/**
set wildignore+=**/tmp
set wildignore+=**/log
set wildignore+=**/.build

" Make it obvious where 100 characters is
set textwidth=100
set colorcolumn=+1

" Numbers
" set relativenumber number
set number
set numberwidth=5

" Tab completion
" will insert tab at beginning of line,
" will use completion if not at beginning
set wildmode=list:longest,list:full
function! InsertTabWrapper()
    let col = col('.') - 1
    if !col || getline('.')[col - 1] !~ '\k'
        return "\<tab>"
    else
        return "\<c-p>"
    endif
endfunction
inoremap <Tab> <c-r>=InsertTabWrapper()<cr>
inoremap <S-Tab> <c-n>

" Switch between the last two files
nnoremap <leader><leader> <c-^>

" All necessary mappings
nnoremap <silent> <leader>/ :TComment<CR>
nnoremap <C-t> :tabnew<CR>
" nnoremap <C-w> :tabclose<CR>
nnoremap <C-l> gt
nnoremap <C-h> gT
nmap     <C-F> <Plug>CtrlSFPrompt
vmap     <C-F>F <Plug>CtrlSFVwordExec

" Source Vim configuration file and install plugins
nnoremap <silent><leader>1 :source ~/.vimrc \| :PlugInstall<CR>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" vim-test mappings
nnoremap <silent> <Leader>t :w <CR> <bar> :TestFile<CR>
nnoremap <silent> <Leader>s :w <CR> <bar> :TestNearest<CR>
nnoremap <silent> <Leader>l :TestLast<CR>
nnoremap <silent> <Leader>a :TestSuite<CR>
nnoremap <silent> <leader>gt :TestVisit<CR>

" Run commands that require an interactive shell
nnoremap <Leader>r :RunInInteractiveShell<space>

nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gr <Plug>(coc-references)
nmap <leader>ac  <Plug>(coc-codeaction)
nmap <leader>qf  <Plug>(coc-fix-current)

nnoremap <C-p> :GFiles<CR>

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Scroll with touchpad
set mouse=nicr

" Quicker window movement
" nnoremap <S-j> <C-w>j
" nnoremap <S-k> <C-w>k
" nnoremap <S-h> <C-w>h
" nnoremap <S-l> <C-w>l

" configure syntastic syntax checking to check on open as well as save
" Set spellfile to location that is guaranteed to exist, can be symlinked to
" Dropbox or kept in Git and managed outside of thoughtbot/dotfiles using rcm.
" set spellfile=$HOME/.vim-spell-en.utf-8.add

" Autocomplete with dictionary words when spell check is on
" set complete+=kspell

" Always use vertical diffs
set diffopt+=vertical

" Local config
if filereadable($HOME . "/.vimrc.local")
  source ~/.vimrc.local
endif

let g:ale_linters = {
\   'javascript': ['eslint'],
\   'ruby': ['rubocop']
\}

let g:ale_ruby_rubocop_executable = "bin/rubocop"

let g:ale_sign_error = "\u2022"
let g:ale_sign_warning = "\u2022"
let g:ale_sign_column_always = 1

let g:ruby_indent_assignment_style = "variable"

command -nargs=+ G :Gina <args>

set t_Co=256
set termguicolors
set lazyredraw
set nocursorline
set ttyfast

" colorscheme seagull
colorscheme solarized8_light
" colorscheme nord

set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

""http://stackoverflow.com/questions/20186975/vim-mac-how-to-copy-to-clipboard-without-pbcopy
" works only for OS X
let os=substitute(system('uname'), '\n', '', '')
if os == 'Darwin' || os == 'Mac'
  set clipboard^=unnamedplus"
endif

set ruler rulerformat=%40(%=%<%F%m\ \
                      \›\ %l/%L:%v%)


" set header title for journal & enter writing mode
function! JournalMode()
    execute 'normal gg'
    let filename = '# ' . strftime('%d/%m/%y')
    call setline(1, filename)
    execute 'normal o'
    execute 'Goyo'
    execute ':4'
endfunction

" workflow for daily journal
augroup journal
    autocmd!

    " populate journal template
    autocmd VimEnter */journal/**   0r ~/.config/nvim/templates/journal.skeleton

    " set header for the particular journal
    autocmd VimEnter */journal/**   :call JournalMode()
augroup END
