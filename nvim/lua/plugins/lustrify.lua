return {
	dir = vim.fn.stdpath("config") .. "/custom/lustrify",
	name = "lustrify",
	ft = { "html", "svg", "gleam" },
	config = function()
		require("lustrify").setup()
	end,
}
