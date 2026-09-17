local M = {}

M.config = {
	binary = "lustrify",
}

--- Convert the current visual selection (or whole buffer) to Lustre markup.
M.convertFn = function(opts, use_selection)
	local binary = M.config.binary

	-- Check binary exists
	if vim.fn.executable(binary) == 0 then
		vim.notify("lustrify: binary not found at '" .. binary .. "'. Is it on your $PATH?", vim.log.levels.ERROR)
		return
	end

	local lines
	local start_line, end_line

	if use_selection then
		start_line = opts.line1 or vim.fn.line("'<")
		end_line = opts.line2 or vim.fn.line("'>")
		lines = vim.api.nvim_buf_get_lines(0, start_line - 1, end_line, false)
	else
		start_line = 1
		end_line = vim.api.nvim_buf_line_count(0)
		lines = vim.api.nvim_buf_get_lines(0, 0, -1, false)
	end

	local input = table.concat(lines, "\n")

	-- Shell out to the binary
	local result = vim.system({ binary, "--fragment" }, { stdin = input }):wait()

	if result.code ~= 0 then
		vim.notify("lustrify error:\n" .. (result.stderr or "unknown error"), vim.log.levels.ERROR)
		return
	end

	-- Replace the lines in the buffer with the converted output
	local output_lines = vim.split(result.stdout, "\n", { plain = true })
	vim.api.nvim_buf_set_lines(0, start_line - 1, end_line, false, output_lines)
	vim.notify("lustrify: converted successfully", vim.log.levels.INFO)
end

function M.setup(opts)
	M.config = vim.tbl_extend("force", M.config, opts or {})

	-- converts the whole buffer
	vim.api.nvim_create_user_command("Lustrify", function(opts)
		M.convertFn(opts, true)
	end, { range = true, desc = "Convert selection from HTML to Lustre markup" })

	-- converts the current visual selection
	vim.api.nvim_create_user_command("LustrifyFile", function(opts)
		M.convertFn(opts, false)
	end, { range = true, desc = "Convert visual selection from HTML to Lustre markup" })
end

return M
