return {
	dir = vim.fn.stdpath("config") .. "/custom-plugins/lustrify",
	name = "lustrify",
	ft = { "html", "svg", "gleam" },
	config = function()
		require("lustrify").setup()
	end,
}
