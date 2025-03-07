local api = vim.api

vim.api.nvim_create_autocmd({"BufEnter", "FocusGained", "InsertLeave"}, {
  callback = function()
    vim.opt.nu = true
    vim.opt.rnu = true
  end
})

vim.api.nvim_create_autocmd({"BufLeave", "FocusLost", "InsertEnter"}, {
  callback = function()
    vim.opt.nu = true
    vim.opt.rnu = false
  end
})

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank()
  end
})

function _G.set_terminal_keymaps()
  local opts = {buffer = 0}
  --vim.keymap.set('t', '<S-Enter>', [[<C-\><C-n>]], opts)
  --vim.keymap.set('t', '<C-Enter>', [[<C-\><C-n>]], opts)
  vim.keymap.set('t', '<C-h>', [[<Cmd>wincmd h<CR>]], opts)
  vim.keymap.set('t', '<C-j>', [[<Cmd>wincmd j<CR>]], opts)
  vim.keymap.set('t', '<C-k>', [[<Cmd>wincmd k<CR>]], opts)
  vim.keymap.set('t', '<C-l>', [[<Cmd>wincmd l<CR>]], opts)
  --vim.keymap.set('t', '<C-w>', [[<C-\><C-n>]], opts)
end

-- if you only want these mappings for toggle term use term://*toggleterm#* instead
-- vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')
vim.cmd('autocmd! TermOpen term://*toggleterm#* lua set_terminal_keymaps()')

vim.cmd([[
  function! s:copy_results(lines)
    let joined_lines = join(a:lines, "\n")
    if len(a:lines) > 1
      let joined_lines .= "\n"
    endif
    let @+ = joined_lines
  endfunction
  let g:fzf_action = { "ctrl-h": "split", "ctrl-v": "vsplit", "ctrl-y": function('s:copy_results') }
]])

vim.cmd([[
  hi CursorRed guifg=red guibg=red
  set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50,a:blinkwait700-blinkoff400-blinkon250-CursorRed/lCursorRed,sm:block-blinkwait175-blinkoff150-blinkon175
]])

vim.cmd([[
  let g:python3_host_prog = "/usr/bin/python"
]])

vim.cmd([[
  autocmd BufEnter * set cursorline
  autocmd BufLeave * set nocursorline
]])

vim.cmd([[
  command! -bang -nargs=? -complete=dir Files2 call fzf#vim#files(<q-args>, <bang>0)
]])

vim.cmd([[

  " This is beta...

  "let $FZF_DEFAULT_COMMAND='rg --files'
  "let $FZF_DEFAULT_OPTS='-m --height 50% --border'

  "let $FZF_DEFAULT_COMMAND = 'rg --files --hidden' " use ripgrep as the default searcher
  "let $FZF_DEFAULT_COMMAND = 'find . -type f -name "*.java"' " use ripgrep as the default searcher
  "nmap <Leader>pf :FZF<CR>
  "echo $FZF_DEFAULT_COMMAND
]])


vim.cmd([[
  " This is work in progress..

  " An rg that works with preview. Note that filenames that match the search are also in the result (annoying)
  let g:files_command = 'rg --column --line-number --fixed-strings --ignore-case --hidden --follow --color "always" --glob "!.git/" --glob "!target" --glob "!node_modules" --glob "!.settings" --glob "!.classpath" --glob "!.project" --glob "!cache" '
  "working: command! -bang -nargs=* Rg3 call fzf#vim#grep(g:files_command .shellescape(<q-args>), 1, <bang>0 ? fzf#vim#with_preview('up:80%') : fzf#vim#with_preview('right:50%', '?'), <bang>0)
  let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
  command! -bang -nargs=* Rg3 call fzf#vim#grep(g:files_command .shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
]])

vim.cmd([[

  " Please note, this is beta...

  " A version to remove filenames that has rg match.
  "original command! -bang -nargs=* Rg4 call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
  "adding filters  command! -bang -nargs=* Rg4 call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --glob '!.git/' --glob '!target' --glob '!node_modules' --glob '!.settings' --glob '!.classpath' --glob '!.project' --glob '!cache' ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)
  " Trying to add previw:

  command! -bang -nargs=* Rg4 call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case --glob '!.git/' --glob '!target' --glob '!node_modules' --glob '!.settings' --glob '!.classpath' --glob '!.project' --glob '!cache' ".shellescape(<q-args>), 1, fzf#vim#with_preview(), <bang>0)
  " note that for this to work, use let $FZF_DEFAULT_COMMAND='rg --files'
]])

vim.cmd([[
" From: https://thevaluable.dev/fzf-vim-integration/
command! -bang -nargs=* Rg5 call fzf#run(fzf#wrap({
    \ 'source': 'rg --column --line-number --no-heading --glob="!.git/*" '.shellescape(<q-args>),
    \ 'sink': 'edit',
    \ 'options': [
                \ '--multi',
                \ '--pointer', '→',
                \ '--marker', '♡',
                \ '--preview', 'cat {}',
                \ '--preview-window', '50%,border-double,right']
    \ },
    \ <bang>0))
]])


vim.cmd([[
" From: https://thevaluable.dev/fzf-vim-integration/
" Overwrite :Rg from fzf.vim
" Hit '?' to toggle the preview
command! -bang -nargs=* Rg6 call fzf#vim#grep(
  \   'rg
        \ --column
        \ --line-number
        \ --no-heading
        \ --fixed-strings
        \ --ignore-case
        \ --hidden
        \ --follow
        \ --glob "!.git/*"
        \ --color "always" '.shellescape(<q-args>),
  \   fzf#vim#with_preview('right:50%:hidden', '?'),
  \   <bang>0)
]])


-- Check this out too: https://www.reddit.com/r/vim/comments/mb1dyx/fzf_questions/

--vim.lsp.set_log_level("debug")
