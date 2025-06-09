local local_llm_tools = require("local_llm_tools")

local M = {}
M.setup = function(conf)
	local_llm_tools.setup(conf)
end
return M
