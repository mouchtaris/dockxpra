set nocompatible              " be iMproved, required
filetype off                  " required




"""""""""""""""""""""""""""""""""""""""""""""""
""""" Plug Stuff
" Specify a directory for plugins (for Neovim: ~/.local/share/nvim/plugged)
silent! call plug#begin('/usr/share/nvim/plugged')
if exists(':Plug')

  """ " Make sure you use single quotes
  """
  """ " Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
  """ Plug 'junegunn/vim-easy-align'
  """
  """ " Any valid git URL is allowed
  """ Plug 'https://github.com/junegunn/vim-github-dashboard.git'
  """
  """ " Multiple Plug commands can be written in a single line using | separators
  """ Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
  """
  """ " On-demand loading
  """ Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
  """ Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
  """
  """ " Using a non-master branch
  """ Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
  """
  """ " Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
  """ Plug 'fatih/vim-go', { 'tag': '*' }
  """
  """ " Plugin options
  """ Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
  """
  """ " Plugin outside ~/.vim/plugged with post-update hook
  """ Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  """
  """ " Unmanaged plugin (manually installed and updated)
  """ Plug '~/my-prototype-plugin'

  Plug 'Valloric/YouCompleteMe'
  Plug 'wincent/command-t'
  Plug 'bling/vim-airline'
  "Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
  Plug 'sjbach/lusty'
  Plug 'derekwyatt/vim-scala'
  Plug 'altercation/vim-colors-solarized'
  Plug 'vim-ruby/vim-ruby'
  Plug 'kchmck/vim-coffee-script'
  Plug 'jwhitley/vim-literate-coffeescript'
  "Plug 'flazz/vim-colorschemes'
  "Plug 'vim-scripts/BusyBee.git'
  "Plug 'goatslacker/mango.vim'
  Plug 'morhetz/gruvbox'
  "Plug 'dag/vim-fish'
  "Plug 'ktvoelker/sbt-vim'
  Plug 'vim-syntastic/syntastic'
  Plug 'tpope/vim-unimpaired'
  Plug 'fholgado/minibufexpl.vim'
  Plug 'scrooloose/nerdtree'
  Plug 'Xuyuanp/nerdtree-git-plugin'
  Plug 'tpope/vim-projectionist'
  Plug 'ctrlpvim/ctrlp.vim'

  " Initialize plugin system
  call plug#end()
endif



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""'
""" Vundle stuff
" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
"" Plugin 'gmarik/Vundle.vim'
""
"" Plugin 'Valloric/YouCompleteMe'
"" Plugin 'wincent/command-t'
"" Plugin 'bling/vim-airline'
"" " Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
"" Plugin 'sjbach/lusty'
"" Plugin 'derekwyatt/vim-scala'
"" Plugin 'altercation/vim-colors-solarized'
"" Plugin 'vim-ruby/vim-ruby'
"" Plugin 'kchmck/vim-coffee-script'
"" Plugin 'jwhitley/vim-literate-coffeescript'
"" "Plugin 'flazz/vim-colorschemes'
"" "Plugin 'vim-scripts/BusyBee.git'
"" "Plugin 'goatslacker/mango.vim'
"" Plugin 'morhetz/gruvbox'
"" "Plugin 'dag/vim-fish'
"" "Plugin 'ktvoelker/sbt-vim'
"" Plugin 'vim-syntastic/syntastic'
"" Plugin 'tpope/vim-unimpaired'
"" Plugin 'fholgado/minibufexpl.vim'
"" Plugin 'scrooloose/nerdtree'
"" Plugin 'Xuyuanp/nerdtree-git-plugin'
"" Plugin 'tpope/vim-projectionist'
"" Plugin 'ctrlpvim/ctrlp.vim'
""" http://vim.wikia.com/wiki/Use_Vim_like_an_IDE
""" https://jacky.wtf/weblog/moving-to-neovim/


" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
"call vundle#end()            " required
"filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line



""""""""""""""""""""""""""""""""""""""""""""""""""
""" Plugins Configurations
"
"
"" Command-T
let g:CommandTFileScanner='git'
"
"
"" CtrlP
let g:ctrlp_user_command = ['.git', 'git -C %s ls-files']
"
"
"" YouCompleteMe
" explicitly set python to python3 for ycm
let g:ycm_server_python_interpreter='/usr/bin/python'
"
"
"" Recomended beginner configuration by Syntastic
" set statusline+=%#warningmsg#
if exists('SyntasticStatuslineFlag')
  set statusline+=%{SyntasticStatuslineFlag()}
endif
" set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 0 " auto open, auto close
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
let g:syntastic_id_checkers = 1
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_ruby_rubocop_args = '--display-cop-names'

"""""""""""""""""""""""""""""""""""""""""""
""" Neovim adjustments
set mouse=

""""""""""""""""""""""""""""""""""""""""""""""""""
""" Plain VIM configuration
syn on
filetype on
set list
set listchars=eol:$,tab:\|-,trail:x,extends:<,precedes:>,conceal:_
set hlsearch
set breakindent
set autoindent
set nu
set hidden

augroup filetypes
  autocmd BufNewFile,BufReadPost   *.{c++,h++}        set filetype=cpp
  autocmd BufNewFile,BufReadPost   *.fish             set filetype=fish
augroup END

augroup indendations
  autocmd FileType {ruby,haml,sass,fish,json,coffee,litcoffee,yaml,sh,tf}  set ts=2 | set sw=2 | set et
  autocmd FileType {go,java,cs,javascript,cpp}                          set ts=4 | set sw=4 | set et
augroup END

set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set guifont=Inconsolata\ 8

"colorscheme atom-dark
set background=dark

" set background=dark
" colorscheme solarized
silent! colorscheme gruvbox

ruby << EOR
module Isi

  def self.insert_include
    VIM::Window.current.buffer.tap { |buf|
      insert_at_rx =  if /\.h\+\+$/ =~ buf.name
                        then /^\s*#pragma/
                        else /^\s*#include/
                      end
      (1..buf.length).each do |i|
        md = insert_at_rx.match(buf[i])
        if md then
          VIM.command('let include = input("#include ")')
          inc = VIM.evaluate('include')
          buf.append (i + 1), "#include #{inc}"
          VIM.command (buf.line_number + 1).to_s
          break
        end
      end
    }
  end

end
EOR

nmap <Leader>ii :ruby Isi.insert_include<CR>


" From
" http://stackoverflow.com/questions/8324349/display-relative-and-absolute-line-numbers-simultaneously-in-vim
autocmd WinEnter,FocusGained * :setlocal number relativenumber
autocmd WinLeave,FocusLost   * :setlocal number norelativenumber
