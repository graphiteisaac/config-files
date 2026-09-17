local M = {}

M.setup = function(opts)
	M.opts = opts or {}

	vim.api.nvim_create_user_command("Notes", function(cmd_opts)
		local dir = M.opts.dir or "~/Documents/pdox"
		local arg = cmd_opts.args

		if arg == "today" then
			local today = os.date("%d-%m-%y")
			return vim.cmd.edit(vim.fs.joinpath(dir, "daily", today .. ".md"))
		elseif arg == "yesterday" then
			-- Yesterday is just today minus 24 hours
			local yesterday = os.date("%d-%m-%y", os.time() - 86400)
			return vim.cmd.edit(vim.fs.joinpath(dir, "daily", yesterday .. ".md"))
		end

		return print("No argument required, we need 'today' or 'yesterday'!")
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
