local options = {
  backup = false,                          -- creates a backup file
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  swapfile = false,                        -- creates a swapfile
  undofile = true,                         -- enable persistent undo
  undolevels=1000,                         -- Maximum number of changes that can be undone
  undoreload=10000,                        -- Maximum number lines to save for undo on a buffer reload
  history=1000,                            -- Store a ton of history (default is 20)
  mouse = "a",                             -- allow the mouse to be used in neovim
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 4,                          -- the number of spaces inserted for each indentation
  tabstop = 4,                             -- insert 2 spaces for a tab
  smartindent = true,                      -- make indenting smarter again
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  gdefault = true,                         -- Set g switch as default option for re
  ignorecase = true,                       -- ignore case in search patterns
  smartcase = true,                        -- smart case
  hlsearch = true,                         -- highlight all matches on previous search pattern
  timeoutlen = 100,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  updatetime = 300,                        -- faster completion (4000ms default)
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2,                         -- always show tabs
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  cursorline = true,                       -- highlight the current line
  number = true,                           -- set numbered lines
  relativenumber = true,                   -- set relative numbered lines
  numberwidth = 4,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line
  scrolloff = 3,                           -- minimum lines to keep above and below cursor
  sidescrolloff = 8,
  cmdheight = 1,                           -- more space in the neovim command line for displaying messages
  -- guifont = "monospace:h17",               -- the font used in graphical neovim applications
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
}

vim.opt.shortmess:append "c"

for k, v in pairs(options) do
  vim.opt[k] = v
end

vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work
vim.cmd [[let g:netrw_bufsettings = 'noma nomod nu nowrap ro nobl']]

vim.cmd [[
    " Initialize directories {{{ at ~/.local/share/nvim/sessions
    function! InitializeDirectories()
        let parent = $HOME . '/' . '.local' . '/' . 'share' . '/' . 'nvim'
        let prefix = 'sessions'
        let common_dir = parent . '/' . prefix
        if !isdirectory(common_dir)
            call mkdir(common_dir)
        endif
        let dir_list = {
                    \ 'backup': 'backupdir',
                    \ 'views': 'viewdir',
                    \ 'swap': 'directory',
                    \ 'undo': 'undodir' }
        for [dirname, settingname] in items(dir_list)
            let directory = common_dir . '/' . dirname . '/'
            if exists("*mkdir")
                if !isdirectory(directory)
                    call mkdir(directory)
                endif
            endif
            if !isdirectory(directory)
                echo "Warning: Unable to create backup directory: " . directory
                echo "Try: mkdir -p " . directory
            else
                let directory = substitute(directory, " ", "\\\\ ", "g")
                exec "set " . settingname . "=" . directory
            endif
        endfor
    endfunction
    call InitializeDirectories()
    " }}}
]]
