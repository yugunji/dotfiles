set nocompatible               " be iMproved
filetype off

if has('vim_starting')
  if &compatible
    set nocompatible
  endif
  set runtimepath+=~/.vim/bundle/neobundle.vim
  "call neobundle#rc(expand('~/.vim/bundle/'))
endif
" originalrepos on github
call neobundle#begin(expand('~/.vim/bundle'))

NeoBundle 'Shougo/neobundle.vim'
"NeoBundle 'Shougo/vimproc'
"NeoBundle 'VimClojure'
NeoBundle 'Shougo/neomru.vim'
"NeoBundle 'Shougo/vimshell'
"NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplcache'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
"NeoBundle 'jpalardy/vim-slime'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'Shougo/vimfiler'
"NeoBundle 'Shougo/unite-outline'
"NeoBundle 'dgryski/vim-godef'
NeoBundle 'thinca/vim-quickrun'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'fatih/vim-go'
"NeoBundle 'vim-jp/vim-go-extra'

call neobundle#end()

au BufRead,BufNewFile *.md set filetype=markdown
let g:previm_open_cmd = 'open -a Safari'

let g:quickrun_config={'_': {'split': ''}}

""NeoBundle 'https://bitbucket.org/kovisoft/slimv'

filetype plugin indent on     " required!
filetype indent on
syntax on

NeoBundleCheck

set encoding=utf8
set fileencoding=utf-8
set scrolloff=5
set nowrap
set vb t_vb=
set clipboard=unnamed
set number
set ruler

" unite.vim
"let g:unite_source_history_yank_enable=1
"let g:unite_source_file_mru_limit=200
"nnoremap <silent> ,uf :<c-u>Unite file<cr>
"nnoremap <silent> ,ur :<c-u>Unite file_mru<cr>
"nnoremap <silent> ,ub :<c-u>Unite buffer<cr>
"nnoremap <silent> ,uu :<c-u>Unite buffer file_mru<cr>
"nnoremap <silent> ,uo :<c-u>Unite outline<cr>
"nnoremap <silent> ,un :<c-u>Unite file/new<cr>
"nnoremap <silent> ,uy :<c-u>Unite history/yank<cr>

" VimShell
"nnoremap <silent> ,vs :VimShell<cr>
"nnoremap <silent> ,vspy :VimShellInteractive python<cr>
"nnoremap <silent> ,vsph :VimShellInteractive php<cr>
"nnoremap <silent> ,vspe :VimShellInteractive perl<cr>
"nnoremap <silent> ,vss :VimShellSendString<cr>

set ignorecase
set smartcase
set incsearch
set nowrapscan
set history=1000
set expandtab
set tabstop=2
set autoindent
set hlsearch
set shiftwidth=2
set laststatus=2

" neocompletecache
set completeopt=menuone
 
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_camel_case_completion  =  1
let g:neocomplcache_max_list = 20
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'php' : $HOME . '/.vim/dict/php.dict',
    \ 'ctp' : $HOME . '/.vim/dict/php.dict'
    \ }
 
if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'
 
imap <C-k> <Plug>(neosnippet_expand_or_jump)
smap <C-k> <Plug>(neosnippet_expand_or_jump)
 
inoremap <expr><C-g> neocomplcache#undo_completion()
inoremap <expr><C-l> neocomplcache#complete_common_string()
inoremap <expr><CR> neocomplcache#smart_close_popup() . "\<CR>"
inoremap <expr><TAB> pumvisible() ? "\<Down>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<Up>" : "\<S-TAB>"
inoremap <expr><C-h> neocomplcache#smart_close_popup().”\<C-h>”
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()

colorscheme desert

filetype plugin indent on

nmap t :TagbarToggle<CR>
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>

let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
    \ }

" for golang {{{
"set rtp+=$GOPATH/src/github.com/nsf/gocode/vim
"set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
"let g:gofmt_command = 'goimports'
"au BufNewFile,BufRead *.go set sw=2 noexpandtab ts=2 completeopt=menu,preview
"au FileType go autocmd BufWritePre  Fmt
"au FileType go compiler go

"let g:syntastic_go_checkers = ['go', 'golint']
"let g:syntastic_mode_map = { "mode": "passive", "active_filetypes": ["go"] }
"
"vim-goの設定
"let g:go_fmt_autosave = 1
"let g:go_fmt_fail_silently = 1
"au FileType go nmap <Leader>gd <Plug>(go-doc)
"au FileType go nmap <leader>b <Plug>(go-build)
"" }}}

" VimFilerTree {{{
"command! VimFilerTree call VimFilerTree()
"function VimFilerTree()
"    exec ':VimFiler -buffer-name=explorer -split -simple -winwidth=45 -toggle -no-quit'
"    wincmd t
"    setl winfixwidth
"endfunction
"autocmd! FileType vimfiler call g:my_vimfiler_settings()
"function! g:my_vimfiler_settings()
"    nmap     <buffer><expr><CR> vimfiler#smart_cursor_map("\<Plug>(vimfiler_expand_tree)", "\<Plug>(vimfiler_edit_file)")
"    nnoremap <buffer>s          :call vimfiler#mappings#do_action('my_split')<CR>
"    nnoremap <buffer>v          :call vimfiler#mappings#do_action('my_vsplit')<CR>
"endfunction

"let my_action = {'is_selectable' : 1}
"function! my_action.func(candidates)
"    wincmd p
"    exec 'split '. a:candidates[0].action__path
"endfunction
"call unite#custom_action('file', 'my_split', my_action)

"let my_action = {'is_selectable' : 1}
"function! my_action.func(candidates)
"    wincmd p
"    exec 'vsplit '. a:candidates[0].action__path
"endfunction
"call unite#custom_action('file', 'my_vsplit', my_action)
" }}}
"

"set runtimepath+=$GOROOT/misc/vim
"set path+=$GOPATH/src/**
"set rtp+=$GOPATH/src/github.com/nsf/gocode/vim
"set rtp+=$GOPATH/src/github.com/golang/lint/misc/vim
"au BufNewFile,BufRead *.go set sw=2 noexpandtab ts=2 completeopt=menu,preview
"au FileType go au BufWritePre Fmt
"au FileType go compiler go
"set completeopt=menu,preview
""
let g:syntastic_go_checkers = ['go', 'golint']
let g:syntastic_mode_map = { "mode": "passive", "active_filetypes": ["go"] }
"
""vim-goの設定
let g:go_fmt_autosave = 1
let g:go_fmt_fail_silently = 0
"au FileType go nmap <Leader>gd <Plug>(go-doc)
"au FileType go nmap <leader>b <Plug>(go-build)
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_fmt_command = "goimports"

""
"cnoremap goi GoImport<space>


"filetype off
"filetype plugin indent off
