 " { Plugins
    set nocompatible " be iMproved, required
    filetype off " required (for Vundle)

    " Set the runtime path to include Vundle and inititalize
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin('~/.vim/bundle')

    " let Vundle manage Vundle, required
    Plugin 'gmarik/Vundle.vim'

    " Git integration
    Plugin 'tpope/vim-fugitive'
    nnoremap <leader>g :G<CR>

    " Lean & mean status/tabline for vim that's light as air
    Plugin 'bling/vim-airline'

    " Automatically displays all buffers when there's only one tab open.
    let g:airline#extensions#tabline#enabled = 1
    let g:airline#extensions#ale#enabled = 1

    " Toggle line numbering mode on focus and insert mode
    Plugin 'jeffkreeftmeijer/vim-numbertoggle'

    " " File explorer
    " Plugin 'scrooloose/nerdtree'

    " " Toggle NERDTree
    " "nnoremap <c-n> :NERDTreeToggle<CR>

    " " Find current file in NERDTree
    " "nnoremap <leader>f :NERDTreeFind<CR>

    " " Filter node_modules from NERDTree
    " let g:NERDTreeIgnore=['node_modules$[[dir]]', 'dist$[[dir]]']

    " "Close vim if the only window left open is NERDTree
    " " autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

    " " Use this option to tell the script when (if at all) to change the current
    " " working directory (CWD) for vim.

    " " If it is set to 0 then the CWD is never changed by the NERD tree.

    " " If set to 1 then the CWD is changed when the NERD tree is first loaded to the
    " " directory it is initialized in. For example, if you start the NERD tree with >
    " "     :NERDTree /home/marty/foobar
    " " <
    " " then the CWD will be changed to /home/marty/foobar and will not be changed
    " " again unless you init another NERD tree with a similar command.

    " " If the option is set to 2 then it behaves the same as if set to 1 except that
    " " the CWD is changed whenever the tree root is changed. For example, if the CWD
    " " is /home/marty/foobar and you make the node for /home/marty/foobar/baz the new
    " " root then the CWD will become /home/marty/foobar/baz.
    " let g:NERDTreeChDirMode = 2
    " function ChangeDirectory(dir, ...)

      " let &cdpath = ',' . getcwd()

      " exe "bufdo! " . "cd " . (a:dir)

      " let stay = exists("a:1") ? a:1 : 1

        " NERDTree

        " if !stay
          " wincmd p
        " endif

      " wincmd l

    " endfunction

    " " Git status in nerdtree
    " Plugin 'Xuyuanp/nerdtree-git-plugin'

    " Be able to change/add/delete surround characters/tags
    Plugin 'tpope/vim-surround'

    " Working with variants of a word.
    Plugin 'tpope/vim-abolish'

    " Enhance the . command to work on plugin maps.
    Plugin 'tpope/vim-repeat'

    " Quickly get to back/next or toggling on pairs of commands.
    Plugin 'tpope/vim-unimpaired'

    " " Quickly navigate
    " Plugin 'easymotion/vim-easymotion'

    " Full path fuzzy file, buffer, mru, tag, ... finder for Vim
    " Plugin 'kien/ctrlp.vim'

    " Map CtrlP
    " let g:ctrlp_map = '<c-p>'

    " When invoked, unless a starting directory is specified, CtrlP will set its local working directory according to this variable
    "    'c' - the directory of the current file.
    "    'r' - the nearest ancestor that contains one of these directories or files: .git .hg .svn .bzr _darcs
    "    'a' - like c, but only if the current working directory outside of CtrlP is not a direct ancestor of the directory of the current file.
    "    0 or '' (empty string) - disable this feature.
    " let g:ctrlp_working_path_mode = 'r'
    " let g:ctrlp_max_files = 0
    " let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist)|(\.(swp|ico|git|svn|png)$)'
    " " Show dotfiles in ctrlp
    " let g:ctrlp_show_hidden = 1

    " Asynchronous linting/fixing for Vim and Language Server Protocol (LSP) integration
    Plugin 'w0rp/ale'

    let g:ale_linters = {
      \ 'javascript': ['prettier', 'eslint'],
      \ 'typescript': ['prettier', 'tslint']
      \ }
    let g:ale_fixers = {
      \ 'javascript': ['prettier', 'eslint'],
      \ 'typescript': ['prettier', 'tslint']
      \ }
    let g:ale_fix_on_save = 1

    " Javascript highlighting/syntax
    " Plugin 'pangloss/vim-javascript'

    " " JSX highlighting
    " Plugin 'mxw/vim-jsx'

    " JSON highlighting/syntax
    " Plugin 'elzr/vim-json'

    " " Syntax highlighting for pug (formerly jade)
    " Plugin 'digitaltoad/vim-pug'

    " So many colorschemes available!
    Plugin 'flazz/vim-colorschemes'

    " Comments
    Plugin 'scrooloose/nerdcommenter'
    let g:NERDSpaceDelims = 1

    " Fix use of tab from multiple completion plugins
    Plugin 'ervandew/supertab'

    " Code completion
    "Plugin 'Valloric/YouCompleteMe'

    " Typescript syntax highlighting
    " Plugin 'leafgarland/typescript-vim'

    " Async execution library (Used by tsuquyomi)
    " Plugin 'Shougo/vimproc.vim'

    " Typescript IDE features
    " Plugin 'Quramy/tsuquyomi'

    " If set, Tsuquyomi generates import blocks using single quotes
    " instead of double quotes when |:TsuquyomiImport|.
    " let g:tsuquyomi_single_quote_import = 1

    " Syntax highlighting for.... everything
    " Plugin 'sheerun/vim-polyglot'

    " Live previewing of markdown files
    " Plugin 'shime/vim-livedown'

    " " Makes editing tables easier.
    " Plugin 'dhruvasagar/vim-table-mode'

    " " Add snippets to vim.
    " Plugin 'SirVer/ultisnips'

    " " Snippets are separated from the engine.
    " Plugin 'honza/vim-snippets'

    " Allow for alternating files.
    Plugin 'tpope/vim-projectionist'
    nnoremap <leader>a :A<CR>

    " Make working with tabs easier.
    Plugin 'gcmt/taboo.vim'

    " Make working with sessions easier.
    Plugin 'tpope/vim-obsession'

    " All plugins must be added before the following line
    call vundle#end()
"}

" { Working with files
    " Allow filetype plugins
    " Enable loading the plugin files for specific file types.
    " If filetype detection was not switched on yet, it will be as well.
    filetype plugin on
    " Enable loading the indent file for specific file types.
    filetype indent on

    " Getting autocomplete working.
    set omnifunc=syntaxcomplete#Complete

    " Exclude files and directories using Vim's wildignore and CtrlP's own g:ctrlp_custom_ignore
    set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe

    " When a file has been detected to have been changed outside of Vim and
    " it has not been changed inside of Vim, automatically read it again.
    " When the file has been deleted this is not done.
    set autoread

    " When this option is set, the syntax with this name is loaded.
    syntax enable
    " Syntax highlighting was breaking with large files. I believe this will
    " allow it to work for up to 10k line files.
    syntax sync minlines=10000

    " This is how long vim has to draw and do syntax highlighting. If syntax
    " highlighting takes longer than this there is no syntax highlighting at
    " all. The default appears to be 2000, so this gives it 3 times as long to
    " open and highlight correctly.
    set redrawtime=6000

    " Sets the character encoding used inside Vim.  It applies to text in
    " the buffers, registers, Strings in expressions, text stored in the
    " viminfo file, etc.  It sets the kind of characters which Vim can work
    " with.  See |encoding-names| for the possible values.
    set encoding=utf8

    " Set button to toggle line numbering. Can also use "cor" to toggle
    " relative and "con" to toggle absolute.
    nnoremap <silent> <C-x> :set relativenumber!<cr>

    " Open .init.vim in a vertical split on the right.
    " botright (open next split in the bottom or right)
    " vsplit open vertical split.
    nnoremap <leader>v :botright vsplit ~/.config/nvim/init.vim<CR>
    " When done editing the .init.vim use this to quickly source it.
    nnoremap <leader><leader>v :source ~/.config/nvim/init.vim<CR>

    " Open .bashrc in a vertical split on the right.
    " botright (open next split in the bottom or right)
    " vsplit open vertical split.
    nnoremap <leader>z :botright vsplit ~/.zshrc<CR>

    " Make Ctrl-\ switch to the last open file.
    nnoremap <c-\> :b#<CR>

    " Faster way to save.
    " Save the file you're in.
    nnoremap <leader>w :update<CR>
    " Save all files.
    nnoremap <leader><leader>w :wa<CR>

    " Reload the file from disk. Handy when you changed things out with
    " source control (for instance). Think of it as "<leader> edit"
    nnoremap <leader>e :e!<CR>

    " Fix to handle bug I'm only seeing on Mac so far with a buffer going
    " unmodifiable. I'm thinking of this one as <leader>r(eload)
    nnoremap <leader>r :set ma<CR>:e!<CR>

    " Allow for saving as sudo.
    cnoremap w!! w !sudo tee > /dev/null %
    cnoremap <expr> %% getcmdtype() == ':' ? expand ('%:h').'/' : '%%'

    " Make vim write to filestystem on :w
    set backupcopy=yes
"}

" { Visual
    if has("gui_running")
        set guioptions-=m " remove menu bar
        set guioptions-=T  "remove toolbar
        set guioptions-=r  "remove right-hand scroll bar
        set guioptions-=L  "remove left-hand scroll bar
    endif

    " When set to "dark", Vim will try to use colors that look good on a
    " dark background.  When set to "light", Vim will try to use colors that
    " look good on a light background.  Any other value is illegal.
    set background=dark

    " Load color scheme {name}.  This searches 'runtimepath'
    " for the file "colors/{name}.vim".  The first one that
    " is found is loaded.
    try
        colorscheme desertink
    catch
    endtry

    " When this option is set, the screen will not be redrawn while
    " executing macros, registers and other commands that have not been
    " typed.  Also, updating the window title is postponed.  To force an
    " update use |:redraw|.
    set lazyredraw

    " When a bracket is inserted, briefly jump to the matching one.  The
    " jump is only done if the match can be seen on the screen.  The time to
    " show the match can be set with 'matchtime'.
    " A Beep is given if there is no match (no matter if the match can be
    " seen or not).  This option is reset when the 'paste' option is set.
    " When the 'm' flag is not included in 'cpoptions', typing a character
    " will immediately move the cursor back to where it belongs.
    set showmatch

    " Tenths of a second to show the matching paren, when 'showmatch' is
    " set.  Note that this is not in milliseconds, like other options that
    " set a time.  This is to be compatible with Nvi.
    set matchtime=2

    " Change the way text is displayed.  This is comma separated list of
    " flags:
    " lastline  When included, as much as possible of the last line
    "       in a window will be displayed.  "@@@" is put in the
    "       last columns of the last screen line to indicate the
    "       rest of the line is not displayed.
    " truncate  Like "lastline", but "@@@" is displayed in the first
    "       column of the last screen line.  Overrules "lastline".
    " uhex      Show unprintable characters hexadecimal as <xx>
    "       instead of using ^C and ~C.

    " When neither "lastline" nor "truncate" is included, a last line that
    " doesn't fit is replaced with "@" lines.
    set display+=lastline

    let g:vim_json_syntax_conceal = 0

    " Makes it easy to see where you are.
    set cursorline cursorcolumn
"}

" { Line numbers and status line
    " Show the line number relative to the line with the cursor in front of
    " each line. Relative line numbers help you use the |count| you can
    " precede some vertical motion commands (e.g. j k + -) with, without
    " having to calculate it yourself. Especially useful in combination with
    " other commands (e.g. y d c < > gq gw =).
    set relativenumber

    " Print the line number in front of each line.
    " If relativenumber enabled, show absolute line number on current line
    set number

    " Always show the status line
    " The value of this option influences when the last window will have a
    " status line:
    "     0: never
    "     1: only if there are at least two windows
    "     2: always
    set laststatus=2

    " Show the line and column number of the cursor position, separated by a
    " comma.  When there is room, the relative position of the displayed
    " text in the file is shown on the far right:
    "    Top    first line is visible
    "    Bot    last line is visible
    "    All    first and last line are visible
    "    45%    relative position in the file
    set ruler

    " Format the status line
    " set statusline=\%F%m%r%h\ %w\ \ CWD:\ %r%{getcwd()}%h\ \ \ Line:\ %l
    " set statusline+=%t       "tail of the filename
    " set line+=%m      "modified flag
    " set statusline+=\ [%{strlen(&fenc)?&fenc:'none'}, "file encoding
    " set statusline+=%{&ff}] "file format
    " set statusline+=%h      "help file flag
    " set statusline+=%r      "read only flag
    " set statusline+=%y      "filetype
    " set statusline+=\ \ \ CWD:\ %r%{getcwd()}
    " set statusline+=%=      "left/right separator
    " set statusline+=%c,     "cursor column
    " set statusline+=%l/%L   "cursor line/total lines
    " set statusline+=\ %P    "percent through fileh%m%r%y%=%c,%l/%L\ %P
"}

" { Searching
    " Override the 'ignorecase' option if the search pattern contains upper
    " case characters.  Only used when the search pattern is typed and
    " 'ignorecase' option is on.  Used for the commands "/", "?", "n", "N",
    " ":g" and ":s".  Not used for "*", "#", "gd", tag search, etc.  After
    " "*" and "#" you can make 'smartcase' used by doing a "/" command,
    " recalling the search pattern from history and hitting <Enter>.
    set smartcase

    " Ignore case in search patterns.  Also used when searching in the tags
    " file.
    set ignorecase

    " Set the current search to the word under the cursor without moving you.
    " Will highlight the word and put it in the "/ register.
    nnoremap <silent> <leader>/ *#

    " Disable higlighting until the next search.
    " nnoremap <silent> <space> :noh<CR>

    " When there is a previous search pattern, highlight all its matches.
    " The type of highlighting used can be set with the 'l' occasion in the
    " 'highlight' option.  This uses the "Search" highlight group by
    " default.  Note that only the matching text is highlighted, any offsets
    " are not applied.
    set hlsearch

    " While typing a search command, show where the pattern, as it was typed
    " so far, matches.  The matched string is highlighted.  If the pattern
    " is invalid or not found, nothing is shown.  The screen will be updated
    " often, this is only useful on fast terminals.
    set incsearch

    " Changes the special characters that can be used in search patterns.
    " See |pattern|.
    " NOTE: To avoid portability problems with using patterns, always keep
    " this option at the default "on".  Only switch it off when working with
    " old Vi scripts.  In any other situation write patterns that work when
    " 'magic' is on.  Include "\M" when you want to |/\M|.
    set magic
"}

" { Misc
    " Put Vim in Paste mode.  This is useful if you want to cut or copy
    " some text from one window and paste it in Vim.  This will avoid
    " unexpected effects.
    " Setting this option is useful when using Vim in a terminal, where Vim
    " cannot distinguish between typed text and pasted text.  In the GUI, Vim
    " knows about pasting and will mostly do the right thing without 'paste'
    " being set.  The same is true for a terminal where Vim handles the
    " mouse clicks itself.
    "set paste

    " Make vim use the system clipboard by default
    set clipboard=unnamed

    " Number of screen lines to use for the command-line.  Helps avoiding
    " |hit-enter| prompts.
    set cmdheight=2

    " When off a buffer is unloaded when it is |abandon|ed.  When on a
    " buffer becomes hidden when it is |abandon|ed.  If the buffer is still
    " displayed in another window, it does not become hidden, of course.
    set hidden

    " A history of ":" commands, and a history of previous search patterns
    " are remembered.  This option decides how many entries may be stored in
    " each of these histories (see |cmdline-editing|).
    set history=1000

    " A comma separated list of options for Insert mode completion
    " |ins-completion|.  Options include:
    "  preview  Show extra information about the currently selected
    "     completion in the preview window.  Only works in
    "     combination with "menu" or "menuone".
    "set completeopt-=preview

    " Set startup directory.
    cd ~/dev

    " This defines what bases Vim will consider for numbers when using the
    " CTRL-A and CTRL-X commands for adding to and subtracting from a number
    " respectively; see |CTRL-A| for more info on these commands.
    "
    " Numbers which simply begin with a digit in the range 1-9 are always
    " considered decimal.  This also happens for numbers that are not
    " recognized as octal or hex.
    " This will make CTRL-A/CTRL-X make 007 go to 008 and vice versa.
    set nrformats-=octal
    "
    " This is a sequence of letters which describes how automatic
    " formatting is to be done.
    "
    " j Where it makes sense, remove a comment leader when joining lines.  For
    "   example, joining:
    "       int i;   // the index ~
    "                // in the list ~
    "   Becomes:
    "       int i;   // the index in the list ~
    set formatoptions+=j
"}

" { Movement including when deleting
    " Minimal number of screen lines to keep above and below the cursor.
    " This will make some context visible around where you are working.
    set scrolloff=3

    " The minimal number of screen columns to keep to the left and to the
    " right of the cursor if 'nowrap' is set.  Setting this option to a
    set sidescrolloff=5

    " Influences the working of <BS>, <Del>, CTRL-W and CTRL-U in Insert
    " mode.  This is a list of items, separated by commas.  Each item allows
    " a way to backspace over something:
    " value    effect    ~
    "   indent        allow backspacing over autoindent
    "   eol            allow backspacing over line breaks (join lines)
    "   start        allow backspacing over the start of insert; CTRL-W and CTRL-U
    "                 stop once at the start of insert.
    " When the value is empty, Vi compatible backspacing is used.
    set backspace=indent,eol,start

    " Allow specified keys that move the cursor left/right to move to the
    " previous/next line when the cursor is on the first/last character in
    " the line.  Concatenate characters to allow this for these keys:
    "     char   key      mode    ~
    "      b    <BS>     Normal and Visual
    "      s    <Space>     Normal and Visual
    "      h    "h"     Normal and Visual (not recommended)
    "      l    "l"     Normal and Visual (not recommended)
    "      <    <Left>     Normal and Visual
    "      >    <Right>     Normal and Visual
    "      ~    "~"     Normal
    "      [    <Left>     Insert and Replace
    "      ]    <Right>     Insert and Replace
    set whichwrap=b,s,<,>,h,l

    " Useful for navigating windows.
    " nnoremap <C-j> <C-W>j
    " nnoremap <C-k> <C-W>k
    " nnoremap <C-h> <C-W>h
    " nnoremap <C-l> <C-W>l
"}

" { Tab completion in menus
    " Completion mode that is used for the character specified with
    " 'wildchar'.  It is a comma separated list of up to four parts.  Each
    " part specifies what to do for each consecutive use of 'wildchar'.  The
    " first part specifies the behavior for the first use of 'wildchar',
    " The second part for the second use, etc.
    " These are the possible values for each part:
    " ""        Complete only the first match.
    " "full"        Complete the next full match.  After the last match,
    "         the original string is used and then the first match
    "         again.
    " "longest"    Complete till longest common string.  If this doesn't
    "         result in a longer string, use the next part.
    " "longest:full"    Like "longest", but also start 'wildmenu' if it is
    "         enabled.
    " "list"        When more than one match, list all matches.
    " "list:full"    When more than one match, list all matches and
    "         complete first match.
    " "list:longest"    When more than one match, list all matches and
    "         complete till longest common string.
    " When there is only a single match, it is fully completed in all cases.
    set wildmode=longest,full

    " When 'wildmenu' is on, command-line completion operates in an enhanced
    " mode.  On pressing 'wildchar' (usually <Tab>) to invoke completion,
    " the possible matches are shown just above the command line, with the
    " first match highlighted (overwriting the status line, if there is
    " one).  Keys that show the previous/next match, such as <Tab> or
    " CTRL-P/CTRL-N, cause the highlight to move to the appropriate match.
    " When 'wildmode' is used, "wildmenu" mode is used where "full" is
    " specified.  "longest" and "list" do not start "wildmenu" mode.
    set wildmenu
"}

" { Language
    let $LANG='en'
    " Language to use for menu translation.
    set langmenu=en
"}

" { Tab settings
    " Set tabstop to tell vim how many columns a tab counts for. Linux kernel
    " code expects each tab to be eight columns wide. Visual Studio expects
    " each tab to be four columns wide. This is the only command here that
    " will affect how existing text displays.
    set tabstop=2

    " Set softtabstop to control how many columns vim uses when you hit Tab in
    " insert mode. If softtabstop is less than tabstop and expandtab is not
    " set, vim will use a combination of tabs and spaces to make up the desired
    " spacing. If softtabstop equals tabstop and expandtab is not set, vim
    " will always use tabs. When expandtab is set, vim will always use the
    " appropriate number of spaces.
    set softtabstop=2

    " Set shiftwidth to control how many columns text is indented with the
    " reindent operations (<< and >>) and automatic C-style indentation.
    set shiftwidth=2

    " When expandtab is set, hitting Tab in insert mode will produce the
    " appropriate number of spaces.
    set expandtab

    " When on, a <Tab> in front of a line inserts blanks according to
    " 'shiftwidth'.  'tabstop' or 'softtabstop' is used in other places.  A
    " <BS> will delete a 'shiftwidth' worth of space at the start of the
    " line.
    set smarttab

    " Copy indent from current line when starting a new line (typing <CR>
    " in Insert mode or when using the "o" or "O" command).  If you do not
    " type anything on the new line except <BS> or CTRL-D and then type
    " <Esc>, CTRL-O or <CR>, the indent is deleted again.  Moving the cursor
    " to another line has the same effect, unless the 'I' flag is included
    " in 'cpoptions'.
    " When autoindent is on, formatting (with the "gq" command or when you
    " reach 'textwidth' in Insert mode) uses the indentation of the first
    " line.
    " When 'smartindent' or 'cindent' is on the indent is changed in
    " a different way.
    " The 'autoindent' option is reset when the 'paste' option is set and
    " restored when 'paste' is reset.
    set autoindent

    " Round indent to multiple of 'shiftwidth'.  Applies to > and <
    " commands.  CTRL-T and CTRL-D in Insert mode always round the indent to
    " a multiple of 'shiftwidth' (this is Vi compatible).
    " NOTE: This option is reset when 'compatible' is set.
    set shiftround

    " When on, Vim will change the current working directory whenever you
    " open a file, switch buffers, delete a buffer or open/close a window.
    " It will change to the directory containing the file which was opened
    " or selected.
    " set autochdir
"}

" { Snippet configuration.
  " Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
  " let g:UltiSnipsExpandTrigger="<C-k>"
  " let g:UltiSnipsJumpForwardTrigger="<C-f>"
  " let g:UltiSnipsJumpBackwardTrigger="<C-b>"

  " let g:UltiSnipsSnippetDirectories = ['/home/prijer01/.vim/ultisnips']
"}

" { Sessions
  " Set our session directory that we'll save our session files (in the .vim
  " format) into.
  let g:sessions_dir = '~/.vim/sessions/'

  " Create a mapping of "ss" for session save that will call the Obsession
  " command from vim-obsession to overwrite and watch our session, updating it
  " when we make layout changes or quit.
  exec 'nnoremap <Leader>ss :Obsession ' . g:sessions_dir . '*.vim<C-D><BS><BS><BS><BS><BS>'

  " Open an existing session, showing us the available sessions.
  exec 'nnoremap <Leader>so :so ' . g:sessions_dir . '*.vim<C-D><BS><BS><BS><BS><BS>'

  " Pause tracking of the current session. Rerun to start tracking again.
  exec 'nnoremap <Leader>sp :Obsession<CR>'

  set sessionoptions+=tabpages,globals
" }

" { Insert mode tweaks
  " Something about Mac or iTerm2 is killing my <C-j> functionality in insert
  " mode so this map is to restore it's behavior. <C-j> creates a new line
  " above the current line by default.
  "inoremap <C-j> <C-o>O
" }

" { Use ag for searching
  " The Silver Searcher
  " if executable('ag')
    " " Use ag over grep
    " set grepprg=ag\ --nogroup\ --nocolor

    " " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
    " let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

    " " ag is fast enough that CtrlP doesn't need to cache
    " " let g:ctrlp_use_caching = 0
    " " (That *should* be true unless you're in a mono repo D:)
  " endif

  " Remap K into something actually *useful*: searching for the word under the
  " cursor instead of running man on it.
  " nnoremap <expr> K yiw:grep! '\bEscapeText('<C-R>"')\b'<CR>:cw<CR>
  " nnoremap <expr> K ":grep! -Q " .. expand("<cword>") ..  "<CR>:cw<CR>"

  " Have a way to browse the quickfix list and have a simple combination to
  " hit to open the spot under the cursor.
  "nnoremap <leader>o :.cc<CR>

  " Create command to search with ag called AG (Very creative) and bind it
  " command -nargs=+ -complete=file -bar Ag silent! grep! <args>|cwindow|redraw!
  " nnoremap <leader>s :Ag<SPACE>

  " Ag integration
  " Can use "ag --vimgrep" to report every match on the line.
  " let g:ackprg = 'ag --nogroup --nocolor --column'
" }

lua require('config')
