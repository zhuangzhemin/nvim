vim.cmd [[
try
  " colorscheme onedarker
  colorscheme onedark
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
