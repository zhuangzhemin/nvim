local status_ok, dap = pcall(require, "dap")
if not status_ok then
	return
end

local python_path = function()
  local python3_path = io.popen('which python3');
  python3_path = python3_path:read("*all"); -- read result of command
  python3_path = string.gsub(python3_path, "^(.-)%s*\n*$", "%1") -- strip ending '\n'
  return python3_path
end;

dap.adapters.python = {
  type = 'executable';
  command = python_path();
  args = { '-m', 'debugpy.adapter' };
}

-- Configure the Python debugger with its default values
dap.configurations.python = {
  {
    -- The first three options are required by nvim-dap
    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
    request = 'launch';
    name = "Launch file";
    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
    program = "${file}"; -- This configuration will launch the current file if used.
  },
}


--dap.configurations.python = {
--  {
--    -- The first three options are required by nvim-dap
--    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters.python`
--    request = 'launch';
--    name = "Launch file";
--
--    -- Options below are for debugpy, see https://github.com/microsoft/debugpy/wiki/Debug-configuration-settings for supported options
--    program = "${file}"; -- This configuration will launch the current file if used.
--    --pythonPath = python_path();
--    pythonPath = function()
--      return '/usr/bin/python'
--    end;
--  },
--}


