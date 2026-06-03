-- Inside your nvim-dap config block
local dap = require('dap')

-- 1. Locate the codelldb path installed by Mason
local mason_registry = require('mason-registry')
local codelldb = mason_registry.get_package('codelldb')
local extension_path = codelldb:get_install_path() .. '/extension/'
local codelldb_path = extension_path .. 'adapter/codelldb'

-- 2. Configure the Adapter
dap.adapters.codelldb = {
  type = 'executable',
  command = codelldb_path,
}

-- 3. Define Configurations for C, C++, and Rust
local config = {
  {
    name = 'Launch file',
    type = 'codelldb',
    request = 'launch',
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = '${workspaceFolder}',
    stopOnEntry = false,
  },
}

dap.configurations.c = config
dap.configurations.cpp = config
dap.configurations.rust = config
