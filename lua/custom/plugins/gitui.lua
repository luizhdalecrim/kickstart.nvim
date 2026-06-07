local mason_registry = require('mason-registry')
local gitui = mason_registry.get_package('gitui')

local gitui_path = gitui:get_install_path() .. '/gitui'

vim.keymap.set('n', '<leader>tg', function()
  vim.cmd('terminal ' .. gitui_path)
end, { desc = '[T]oggle [G]itUI' })

