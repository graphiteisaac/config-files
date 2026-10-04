vim.api.nvim_create_autocmd("FileType", {
	pattern = "markdown",
	callback = function()
		local function toggle_markdown_todo()
			local line = vim.api.nvim_get_current_line()
			local updated_line

			if string.find(line, "%- %[ %]") then
				updated_line = string.gsub(line, "%- %[ %]", "- [x]", 1)
			elseif string.find(line, "%- %[x%]") then
				updated_line = string.gsub(line, "%- %[x%]", "- [ ]", 1)
			else
				-- Optional: Convert a plain list item into a todo item
				updated_line = string.gsub(line, "%- ", "- [ ] ", 1)
			end

			if updated_line then
				vim.api.nvim_set_current_line(updated_line)
			end
		end

		-- Set the keymap strictly for the current buffer
		vim.keymap.set("n", "<leader>t", toggle_markdown_todo, { buffer = true, desc = "Toggle Markdown Todo" })
	end,
})
