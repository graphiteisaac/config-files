local M = {}

function M.setup(opts)
	local dir = opts.dir
	vim.api.nvim_create_user_command(
		'Notes',
		function(cmd_opts)
			local today = os.date("%d-%m-%y")
			-- Yesterday is just today minus 24 hours
			local yesterday = os.date("%d-%m-%y", os.time() - 86400)

			local cmds = {
				["today"] = function()
					vim.cmd.edit(vim.fs.joinpath(dir, "daily", today .. ".md"))
				end,
				["yesterday"] = function()
					vim.cmd.edit(vim.fs.joinpath(dir, "daily", yesterday .. ".md"))
				end
			}

			return cmds[cmd_opts.args]()
		end,
		{
			nargs = 1,
			complete = function(arg_lead, _cmd_line, _cursor_pos)
				local possibilities = { "today", "yesterday" }

				return vim.tbl_filter(function(item)
					return vim.startswith(item, arg_lead)
				end, possibilities)
			end
		}
	)
end

return M
