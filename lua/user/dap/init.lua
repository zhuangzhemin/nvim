local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end

--require "user.dap.dap_install"
require "user.dap.nvim_dap_virtual_text"
require "user.dap.nvim_dap_ui"
require "user.dap.python3"

--dap.defaults.fallback.terminal_win_cmd = '50vsplit new'

local api = vim.api
local keymap_restore = {}
dap.listeners.after['event_initialized']['me'] = function()
  for _, buf in pairs(api.nvim_list_bufs()) do
    local keymaps = api.nvim_buf_get_keymap(buf, 'n')
    for _, keymap in pairs(keymaps) do
      if keymap.lhs == "K" then
        table.insert(keymap_restore, keymap)
        api.nvim_buf_del_keymap(buf, 'n', 'K')
      end
    end
  end
  api.nvim_set_keymap(
    -- 'n', 'K', '<Cmd>lua require("dap.ui.widgets").hover()<CR>', { silent = true })
    'n', 'K', '<Cmd>lua require("dapui").eval()<CR>', { silent = true })
end

dap.listeners.after['event_terminated']['me'] = function()
  for _, keymap in pairs(keymap_restore) do
    api.nvim_buf_set_keymap(
      keymap.buffer,
      keymap.mode,
      keymap.lhs,
      keymap.rhs,
      { silent = keymap.silent == 1 }
    )
  end
  keymap_restore = {}
end

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }
keymap("n", "<F4>", ":lua require'dap'.repl.toggle()<CR>", opts)
keymap("n", "<F5>", ":lua require'dap'.continue()<CR>", opts)
keymap("n", "<F6>", ":lua require'dap'.toggle_breakpoint()<CR>", opts)
keymap("n", "<F7>", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", opts)
keymap("n", "<F8>", ":lua require'dap'.step_over()<CR>", opts)
keymap("n", "<F9>", ":lua require'dap'.step_into()<CR>", opts)
keymap("n", "<F10>", ":lua require'dap'.step_out()<CR>", opts)
keymap("n", "<F11>", ":lua require'dapui'.toggle()<CR>", opts)
keymap("n", "<F12>", ":lua require'dap'.terminate()<CR>", opts)

