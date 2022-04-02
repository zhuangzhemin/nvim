local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	return
end

lsp_installer.settings({
    ui = {
        icons = {
            server_installed = "✓",
            server_pending = "➜",
            server_uninstalled = "✗"
        }
    }
})

local servers = {
    "sumneko_lua",
    "vimls",
    "clangd",
    "pyright",
    "bashls",
    "html",
    "lemminx",
    --"yamlls",
    -- "remark_ls",
}

local status_ok, lsp_installer_servers = pcall(require, "nvim-lsp-installer.servers")
if not status_ok then
	return
end

-- Loop through the servers listed above.
for _, server_name in pairs(servers) do
    local server_available, server = lsp_installer_servers.get_server(server_name)
    if server_available then
        server:on_ready(function ()
            -- When this particular server is ready (i.e. when installation is finished or the server is already installed),
            -- this function will be invoked. Make sure not to use the "catch-all" lsp_installer.on_server_ready()
            -- function to set up servers, to avoid doing setting up a server twice.

            local opts = {
              on_attach = require("user.lsp.handlers").on_attach,
              capabilities = require("user.lsp.handlers").capabilities,
            }

           if server.name == "jsonls" then
            local jsonls_opts = require("user.lsp.settings.jsonls")
            opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
           end

           if server.name == "sumneko_lua" then
            local sumneko_opts = require("user.lsp.settings.sumneko_lua")
            opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
           end

           if server.name == "pyright" then
            local pyright_opts = require("user.lsp.settings.pyright")
            opts = vim.tbl_deep_extend("force", pyright_opts, opts)
           end

            server:setup(opts)
        end)
        if not server:is_installed() then
            -- Queue the server to be installed.
            server:install()
        end
    end
end
