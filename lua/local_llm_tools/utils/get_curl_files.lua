local plenary = require "plenary"
local curl = plenary.curl

local scan = plenary.scandir
local curl_abs_path = "/Users/dominik/.config/nvim/lua/tmp/plugins/local_llm_tools.nvim/curl_scripts"
local files = scan.scan_dir(curl_abs_path, { depth = 3 })

local pickers = require("telescope.pickers")
local finders = require("telescope.finders")
local conf = require("telescope.config").values
local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")

local function file_picker()
	pickers.new({}, {
		prompt_title = "Custom File Picker",
		finder = finders.new_table {
			results = files,
		},
		sorter = conf.generic_sorter({}),
		attach_mappings = function(prompt_bufnr, map)
			actions.select_default:replace(function()
				actions.close(prompt_bufnr)
				local selection = action_state.get_selected_entry()
				vim.cmd("edit " .. selection[1])
			end)
			return true
		end,
	}):find()
end

vim.api.nvim_create_user_command("PickMyFiles", file_picker, {})
