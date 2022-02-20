vim.cmd [[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> 
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) 
    autocmd BufWinEnter * :set formatoptions-=cro
    autocmd FileType qf set nobuflisted
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd = 
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end

  function! ResCur()
    if line("'\"") <= line("$")
      silent! normal! g`"
      return 1
    endif
  endfunction

  augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
  augroup END

  autocmd BufEnter * if (bufname("") !~ "^\[A-Za-z0-9\]*://") && (&buftype !=# 'terminal') | lcd %:p:h | endif
  autocmd FileType skill  setlocal foldnestmax=2 foldmethod=indent
  autocmd FileType xml  setlocal shiftwidth=2 tabstop=2 softtabstop=2
  autocmd FileType lua  setlocal shiftwidth=2 tabstop=2 softtabstop=2
  autocmd FileType haskell,puppet,ruby,yml setlocal expandtab shiftwidth=2 softtabstop=2
  autocmd BufNewFile,BufRead *.bean,*.beancount  setlocal iskeyword+=: iskeyword+=-
]]

-- Autoformat
-- augroup _lsp
--   autocmd!
--   autocmd BufWritePre * lua vim.lsp.buf.formatting()
-- augroup end
