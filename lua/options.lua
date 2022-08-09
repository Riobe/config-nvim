local option = vim.api.nvim_set_option

-- When doing vertical splits, create new window pane on the right.
option('splitright', true)

vim.cmd([=[
" If set to 1 then the CWD is changed when the NERD tree is first loaded to the
" directory it is initialized in. For example, if you start the NERD tree with >
"     :NERDTree /home/marty/foobar
" <
" then the CWD will be changed to /home/marty/foobar and will not be changed
" again unless you init another NERD tree with a similar command.
" If the option is set to 2 then it behaves the same as if set to 1 except that
" the CWD is changed whenever the tree root is changed. For example, if the CWD
" is /home/marty/foobar and you make the node for /home/marty/foobar/baz the new
" root then the CWD will become /home/marty/foobar/baz.
let g:NERDTreeChDirMode = 2
function ChangeDirectory(dir, ...)
  let &cdpath = ',' . getcwd()
  exe "bufdo! " . "cd " . (a:dir)
  let stay = exists("a:1") ? a:1 : 1

  " NERDTree

  if !stay
    wincmd p
  endif

  wincmd l
endfunction

" Filter node_modules from NERDTree
let g:NERDTreeIgnore=['node_modules$[[dir]]', 'dist$[[dir]]']

" Close vim if the only window left open is NERDTree
autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

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

    " Set startup directory.
    cd ~/dev

    " Set button to toggle line numbering. Can also use "cor" to toggle
    " relative and "con" to toggle absolute.
    " nnoremap <silent> <C-x> :set relativenumber!<cr>

    " Open .init.vim in a vertical split on the right.
    " botright (open next split in the bottom or right)
    " vsplit open vertical split.
    " nnoremap <leader>v :botright vsplit ~/.config/nvim/init.vim<CR>
    " When done editing the .init.vim use this to quickly source it.
    " nnoremap <leader><leader>v :source ~/.config/nvim/init.vim<CR>

    " Open .bashrc in a vertical split on the right.
    " botright (open next split in the bottom or right)
    " vsplit open vertical split.
    " nnoremap <leader>z :botright vsplit ~/.zshrc<CR>

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
        " colorscheme desertink
        " colorscheme babymate256
        " colorscheme blacklight
        colorscheme codedark
        highlight Normal ctermbg=236
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

    " This defines what bases Vim will consider for numbers when using the
    " CTRL-A and CTRL-X commands for adding to and subtracting from a number
    " respectively; see |CTRL-A| for more info on these commands.
    "
    " Numbers which simply begin with a digit in the range 1-9 are always
    " considered decimal.  This also happens for numbers that are not
    " recognized as octal or hex.
    " This will make CTRL-A/CTRL-X make 007 go to 008 and vice versa.
    set nrformats-=octal

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

set list listchars=trail:⎵

exec "source" . fnamemodify($MYVIMRC, ':h') . '/plugin/bufferline.lua'
]=])
