local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
  return
end

configs.setup {
  ensure_installed = "maintained", -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
  ignore_install = { "" }, -- List of parsers to ignore installing
  autopairs = {
    enable = true,
  },
  highlight = {
    enable = true, -- false will disable the whole extension
    -- disable = { "yaml" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,
  },
  indent = { enable = false, disable = { "yaml" } },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    -- disable = { "yaml" }, -- list of language that will be disabled
  },
  rainbow = {
    enable = false,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    -- disable = { "yaml" }, -- list of language that will be disabled
    extended_mode = false, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    -- max_file_lines = nil, -- Do not enable for files with more than n lines, int
    max_file_lines = 10000, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },
}

-- Enable Folding
vim.o.foldmethod = 'expr'
vim.o.foldexpr = 'nvim_treesitter#foldexpr()'
-- No folding when open file
vim.o.foldlevel = 99 
