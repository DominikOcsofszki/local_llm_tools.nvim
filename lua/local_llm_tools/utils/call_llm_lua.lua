local curl = require "plenary".curl
local M = {}


M.model = "gemma3:1b-it-qat"
M.system = "Code Assistant, better messages, rewriting lines of code"

M.run_llm = function()
	local prompt = "question: Show better coding style"
	local json = { model = M.model, stream = false, system = M.system, prompt = prompt }
	local res = curl.post("http://localhost:11434/api/generate", {
		body = vim.fn.json_encode(json),
		headers = {
			content_type = "application/json",
		},
	}).body
	local x = vim.fn.json_decode(res).response
	vim.print(x)
end

M.run_llm()
