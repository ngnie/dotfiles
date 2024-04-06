set nocompatible

if has("syntax")
  syntax on
endif

" TRANSFERED
imap ii <Esc>

set tabstop=2 shiftwidth=2 softtabstop=2 expandtab autoindent smartindent
set nu rnu

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END

nmap <S-Enter> O<Esc>j
nmap <CR> o<Esc>k
" TRANSFERED END

call plug#begin('~/.vim/plugged')
  " TRANSFERED
  Plug 'mhinz/vim-startify'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " TRANSFERED END
  Plug 'airblade/vim-rooter'
  Plug 'tpope/vim-classpath'
  " TRANSFERED
  Plug 'tpope/vim-surround'
  Plug 'morhetz/gruvbox'
  " TRANSFERED END
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  Plug 'jiangmiao/auto-pairs'
  Plug 'rstacruz/sparkup'
  Plug 'alvan/vim-closetag'
  Plug 'kdheepak/lazygit.nvim', { 'branch': 'nvim-v0.4.3' }
  Plug 'vim-airline/vim-airline'
  Plug 'tpope/vim-dispatch'
  Plug 'neomake/neomake'
  Plug 'christoomey/vim-tmux-navigator'
  Plug 'roxma/vim-tmux-clipboard'
  Plug 'benmills/vimux'
  Plug 'szw/vim-maximizer'
  Plug 'vim-syntastic/syntastic'
  Plug 'tpope/vim-fugitive'
  Plug 'christoomey/vim-conflicted'
  Plug 'leafgarland/typescript-vim'  
  Plug 'easymotion/vim-easymotion'
  Plug 'tpope/vim-repeat'
  Plug 'KKPMW/vim-sendtowindow'
  Plug 'rakr/vim-one' 
  Plug 'preservim/nerdtree'
  Plug 'mfussenegger/nvim-jdtls'
  Plug 'mfussenegger/nvim-dap'
  Plug 'theHamsta/nvim-dap-virtual-text'
  Plug 'rcarriga/nvim-dap-ui'
  Plug 'ryanoasis/vim-devicons'
  Plug 'nvim-lua/lsp-status.nvim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'
  Plug 'ray-x/lsp_signature.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'voldikss/vim-floaterm'

  "Plug 'vim-test/vim-test'
  "Plug 'itchyny/lightline.vim' //looks nice
  "Plug 'rhysd/clever-f.vim'
  "Plug 'dyng/ctrlsf.vim'
  "Plug 'vifm/neovim-vifm'
  "Plug 'vifm/vifm.vim'
  "Plug 'dyng/ctrlsf.vim' "vim-easymotion virker bedre..
  "Plug 'nvim-lua/popup.nvim'
  "Plug 'nvim-lua/plenary.nvim'
  "Plug 'yuttie/comfortable-motion.vim'
call plug#end()

" TRANSFERED
set cursorline

" ThePrimeagen - block move
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" show matches during typing 
set incsearch

" highlight all matches
set hlsearch

" gruvbox
colorscheme gruvbox
set background=dark
" TRANSFERED END

" vim-one
"colorscheme one
"set background=dark

" tokyonight
"colorscheme tokyonight
"set background=dark

let g:airline_theme='one'


set termguicolors
set backspace=indent,eol,start


set ignorecase
set smartcase
set autoread
set modifiable
set buftype=
set encoding=utf8
set noshowmode
set sidescrolloff=999
set scrolloff=999
" set scrolloff=12
"set signcolumn=yes
set signcolumn=number

let mapleader = " "

nnoremap <A-b> <C-w>
nnoremap <A-b>h <C-w>s

nnoremap <silent> <A-h> :exe "vertical resize -5"<CR>
nnoremap <silent> <A-j> :exe "resize +5"<CR>
nnoremap <silent> <A-k> :exe "resize -5"<CR>
nnoremap <silent> <A-l> :exe "vertical resize +5"<CR>

" setup mapping to call :LazyGit
nnoremap <silent> <leader>lg :LazyGit<CR>

" Prover at kommentere dette ud:
" let g:tmux_navigator_no_mappings = 1
" nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
" nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
" nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
" nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
"
" Nedstaaende var kommenteret ud fra start: 
" Disable tmux navigator when zooming the Vim pane
" let g:tmux_navigator_disable_when_zoomed = 1

set splitright
set splitbelow
set clipboard=unnamedplus

" Use tab and shift tab to scroll autocomplete
"inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
"inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : har-fjernet-"-her \<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"


" Maximizer
nmap <silent> <leader>m :MaximizerToggle<CR>


" See buffers
nmap <silent> <leader>bu :Buffers!<CR>


" For Fuzzy finder
let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --glob "!.git/*"'

" TRANSFERED
nmap <silent> <leader>/ :BLines!<CR>
nmap <silent> <leader>rg :Rg!<CR>
nmap <silent> <leader>ag :Ag!<CR>
nmap <silent> <space>ff :Files!<cr>
nmap <silent> <space>FF :Files! ~<cr>
nmap <silent> <space>cc :Commands!<cr>
" TRANSFERED END

" Git
nmap <silent> <space>gf :GFiles<CR>


" Set "<leader>s" to substitute the word under the cursor. Works great with
" CtrlSF!
nmap <leader>ss :%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>


" Use Ripgrep with CtrlSF for performance
let g:ctrlsf_ackprg = '/usr/bin/rg'


" highlight windows
let g:vimade = {}
let g:vimade.fadelevel = 0.5
let g:vimade.enablesigns = 1

" Clever-f.. keep ; and ,
map ; <Plug>(clever-f-repeat-forward)
map , <Plug>(clever-f-repeat-back)

" Find files using Telescope command-line sugar.
"nnoremap <leader>ff <cmd>Telescope find_files<cr>
"nnoremap <leader>fg <cmd>Telescope live_grep<cr>
"nnoremap <leader>fb <cmd>Telescope buffers<cr>
"nnoremap <leader>fh <cmd>Telescope help_tags<cr>

"From Code Smell
nnoremap ; :
vnoremap ; :

"noremap <leader>q :q<CR>
"noremap q <nop>

nmap <silent> <leader>p "0p
nmap <silent> <leader>P "0P

" me: nice but I dont want to forget the others..
"nmap <silent> <leader>' ysiw'
"nmap <silent> <leader>d' ds'
"nmap <silent> <leader>" ysiw"
"nmap <silent> <leader>d" ds"

let g:sendtowindow_use_defaults=0

" Move to word
map  <Leader><Leader>w <Plug>(easymotion-bd-w)
nmap <Leader><Leader>W <Plug>(easymotion-overwin-w)
nmap <Leader><Leader>f <Plug>(easymotion-overwin-f2)

" Open and source init.vim
nnoremap <Leader>os :e $MYVIMRC<CR>
nnoremap <Leader>so :source $MYVIMRC<CR>


" ------------------------------------------------------
" jdtls
"
nnoremap <Leader>joi <Cmd>lua require'jdtls'.organize_imports()<CR>
nnoremap <Leader>jev <Cmd>lua require('jdtls').extract_variable()<CR>
vnoremap <Leader>jev <Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>
nnoremap <Leader>jec <Cmd>lua require('jdtls').extract_constant()<CR>
vnoremap <Leader>jec <Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>
vnoremap <Leader>jem <Esc><Cmd>lua require('jdtls').extract_method(true)<CR>


" ------------------------------------------------------
" test
"
nnoremap <leader>tm <Cmd>lua require'jdtls'.test_nearest_method()<CR>
nnoremap <leader>tc <Cmd>lua require'jdtls'.test_class()<CR>


" ------------------------------------------------------
" dap
"
nnoremap <silent> <leader>db :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <leader>dbc :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <leader>dbl :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <leader>dbe :lua require'dap'.set_exception_breakpoint({"all"})<CR>

nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
nnoremap <silent> <leader>dro :lua require'dap'.repl.open()<CR>
nnoremap <silent> <leader>drl :lua require'dap'.run_last()<CR>

nnoremap <silent> <leader>drc :lua require'dap'.run_to_cursor()<CR>
nnoremap <silent> <leader>dho :lua require'dap.ui.widgets'.hover()<CR>
nnoremap <silent> <leader>dc :lua local widgets=require'dap.ui.widgets';widgets.centered_float(widgets.scopes)<CR>
nnoremap <silent> <leader>dt :lua require'dap'.terminate()<CR>
nnoremap <silent> <leader>du :lua require'dap'.up()<CR>
nnoremap <silent> <leader>dd :lua require'dap'.down()<CR>


" ------------------------------------------------------
" nvim-dap-virtual-text
"
lua <<EOF
require("nvim-dap-virtual-text").setup {
    enabled = true,                     -- enable this plugin (the default)
    enabled_commands = true,            -- create commands DapVirtualTextEnable, DapVirtualTextDisable, DapVirtualTextToggle, (DapVirtualTextForceRefresh for refreshing when debug adapter did not notify its termination)
    highlight_changed_variables = true, -- highlight changed values with NvimDapVirtualTextChanged, else always NvimDapVirtualText
    highlight_new_as_changed = false,   -- highlight new variables in the same way as changed variables (if highlight_changed_variables)
    show_stop_reason = true,            -- show stop reason when stopped for exceptions
    commented = false,                  -- prefix virtual text with comment string
    -- experimental features:
    virt_text_pos = 'eol',              -- position of virtual text, see `:h nvim_buf_set_extmark()`
    all_frames = false,                 -- show virtual text for all stack frames not only current. Only works for debugpy on my machine.
    virt_lines = false,                 -- show virtual lines instead of virtual text (will flicker!)
    virt_text_win_col = nil             -- position the virtual text at a fixed window column (starting from the first text column) ,
                                        -- e.g. 80 to position at column 80, see `:h nvim_buf_set_extmark()`
}
EOF

let g:dap_virtual_text = v:true


" ------------------------------------------------------
" nvim-dap-ui
"
lua <<EOF
require('dapui').setup()
EOF
nnoremap <leader>daq :lua require('dapui').toggle()<CR>
nnoremap <leader>dac :lua require('dapui').close()<CR>
    nnoremap <leader>dao :lua require('dapui').open()<CR>


" ------------------------------------------------------
" vim-devicons
"
lua <<EOF
vim.fn.sign_define('DapBreakpoint', {text='✹', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapBreakpointRejected', {text='✖', texthl='', linehl='', numhl=''})
vim.fn.sign_define('DapStopped', {text='➜', texthl='', linehl='', numhl=''})
EOF


" ------------------------------------------------------
" vim-test
"
"let test#java#runner = 'gradletest'
"let test#java#runner = 'maventest'
" was uncomment: let test#strategy = "neovim"
" was uncomment: let test#strategy = "dispatch"
"nmap <silent> <leader>jtn :TestNearest<CR>
"nmap <silent> <leader>jtf :TestFile<CR>
"nmap <silent> <leader>jts :TestSuite<CR>
"nmap <silent> <leader>jtl :TestLast<CR>
"nmap <silent> <leader>tv :TestVisit<CR>





" ------------------------------------------------------
" nvim-cmp (https://github.com/hrsh7th/nvim-cmp)
"
set completeopt=menu,menuone,noselect

lua <<EOF
  -- Setup nvim-cmp.
  local cmp = require'cmp'

  cmp.setup({
    snippet = {
      -- REQUIRED - you must specify a snippet engine
      expand = function(args)
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
        -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
        -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
      end,
    },
    mapping = {
      ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
      ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
      ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
      ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
      ['<C-e>'] = cmp.mapping({
        i = cmp.mapping.abort(),
        c = cmp.mapping.close(),
      }),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    },
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
      { name = 'vsnip' }, -- For vsnip users.
      -- { name = 'luasnip' }, -- For luasnip users.
      -- { name = 'ultisnips' }, -- For ultisnips users.
      -- { name = 'snippy' }, -- For snippy users.
    }, {
      { name = 'buffer' },
    })
  })

  -- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline('/', {
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

EOF

lua require('ngnie')
