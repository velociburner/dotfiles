local dap, dapui = require("dap"), require("dapui")
local map = vim.keymap.set
local opts = { silent = true }

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

dapui.setup()
require('nvim-dap-virtual-text').setup()
require('dap-python').setup('~/miniconda3/bin/python')

map('n', '<space>sv', '<cmd>lua require("dap").step_over()<cr>', opts)
map('n', '<space>si', '<cmd>lua require("dap").step_into()<cr>', opts)
map('n', '<space>so', '<cmd>lua require("dap").step_out()<cr>', opts)
map('n', '<space>bt', '<cmd>lua require("dap").toggle_breakpoint()<cr>', opts)
map('n', '<space>bc', '<cmd>lua require("dap").set_breakpoint(vim.fn.input("Breakpoint condition: "))<cr>', opts)
map('n', '<space>bl', '<cmd>lua require("dap").set_breakpoint(nil, nil, vim.fn.input("Log point message: "))<cr>', opts)
map('n', '<space>dc', '<cmd>lua require("dap").continue()<cr>', opts)
map('n', '<space>dr', '<cmd>lua require("dap").run_to_cursor()<cr>', opts)
map('n', '<space>dl', '<cmd>lua require("dap").run_last()<cr>', opts)
map('n', '<space>dt', '<cmd>lua require("dap").terminate()<cr>', opts)
