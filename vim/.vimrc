execute pathogen#infect()
syntax enable
:set regexpengine=1
set background=dark
colorscheme solarized
filetype plugin indent on

let mapleader=" "
:set expandtab
:set tabstop=4
:retab
:set shiftwidth=4
:set number
:set backspace=2
:set hlsearch
:set esckeys
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.class,*.gzip,node_modules,DS_Store,*.git,*.png,*.jpg,*.gif,*.jpeg

" Map ,e and ,v to open files in the same directory as the current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <Leader>e :edit %%
map <Leader>v :view %%
nmap <Leader><Leader> :w<CR>
nmap <Leader>x :x<CR>
nmap <Leader>q :q!<CR>
nmap <Leader>ls :ls<CR>
vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
nmap <Leader>tt :tabnew<CR>
nmap <Leader>tc :tabclose<CR>
nmap <Leader>tn :tabnext<CR>
nmap <Leader>tp :tabprevious<CR>
nmap <Leader>- :split<CR>
nmap <Leader>\ :vsplit<CR>

"Easymotion
map <Leader> <Plug>(easymotion-prefix)
map <Leader>/ <Plug>(easymotion-sn)
map <Leader>s <Plug>(easymotion-s2)
omap <Leader>/ <Plug>(easymotion-tn)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
let g:EasyMotion_startofline = 0
let g:EasyMotion_do_mapping = 0
nmap <Leader>s <Plug>(easymotion-s2)

"Ctrl-P
map <Leader>pp :CtrlP .<CR>
map! <C-e> <C-y>, 
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

"Closetags
let g:closetag_filenames = "*.html,*.xhtml,*.phtml,*.html.erb"

vmap <Leader>p "+p
vmap <Leader>P "+P
nmap <Leader>n :NERDTreeToggle<CR>

let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

if has("autocmd")
    autocmd BufWritePre * :silent !mkdir -p %:p:h
end


function! RenameFile()

    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'))
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

map <Leader>rn :call RenameFile()<cr>

"vim-airline
set laststatus=2
set encoding=utf-8
set fillchars+=stl:\ ,stlnc:\
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tmuxline#enabled = 0
let g:airline_theme='powerlineish'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

"syntatic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

map <Leader>c :SyntasticCheck<CR>

"vim-javascript
let g:javascript_conceal_function   = "ƒ"
let g:javascript_conceal_null       = "ø"
let g:javascript_conceal_this       = "@"
let g:javascript_conceal_return     = "⇚"
let g:javascript_conceal_undefined  = "¿"
let g:javascript_conceal_NaN        = "ℕ"
let g:javascript_conceal_prototype  = "¶"
let g:javascript_conceal_static     = "•"
let g:javascript_conceal_super      = "Ω"

"Tagbar
nmap <F8> :TagbarToggle<CR>
"Tabular
if exists(":Tabularize")
    nmap <Leader>a= :Tabularize /=<CR>
    vmap <Leader>a= :Tabularize /=<CR>
    nmap <Leader>a: :Tabularize /:\zs<CR>
    vmap <Leader>a: :Tabularize /:\zs<CR>
endif
"ag
let g:ag_working_path_mode="r"
"vim-jsbeautiry
map <Leader>ff :call JsBeautify()<cr>
