local plenary = require "plenary"

local scan = plenary.scandir
local curl_abs_path = "/Users/dominik/.config/nvim/lua/tmp/plugins/local_llm_tools.nvim/curl_scripts"
local s = scan.scan_dir(curl_abs_path, { depth = 3 })

vim.print(s)
