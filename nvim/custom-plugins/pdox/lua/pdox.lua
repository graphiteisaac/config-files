local M = {}

M.setup = function(opts)
	M.opts = opts or {}

	local function open_and_fill_buffer(filepath, content_string) end

	vim.api.nvim_create_user_command("Notes", function(cmd_opts)
		local dir = vim.fn.expand(M.opts.dir or "~/Documents/pdox")
		local arg = cmd_opts.args

		local file = ""

		if arg == "today" then
			local today = os.date("%d-%m-%y")
			file = vim.fs.joinpath(dir, "daily", today .. ".md")
		elseif arg == "yesterday" then
			-- Yesterday is just today minus 24 hours
			local yesterday = os.date("%d-%m-%y", os.time() - 86400)
			file = vim.fs.joinpath(dir, "daily", yesterday .. ".md")
		end

		if file == "" then
			return print("No argument required, we need 'today' or 'yesterday'!")
		end

		if vim.uv.fs_stat(file) then
			return vim.cmd.edit(file)
		else
			local content = vim.fn.readblob(vim.fs.joinpath(dir, "templates", "daily.md"))
			local out = string.gsub(content, "{date}", os.date("%d %B, %Y"))

			vim.cmd.edit(vim.fn.fnameescape(file))

			local bufnr = vim.api.nvim_get_current_buf()
			local lines = vim.split(out, "\n")

			vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, lines)
		end
	end, {
		nargs = 1,
		complete = function(arg_lead, _cmd_line, _cursor_pos)
			local possibilities = { "today", "yesterday" }

			return vim.tbl_filter(function(item)
				return vim.startswith(item, arg_lead)
			end, possibilities)
		end,
	})
end

return M
