return {
	{
		"pdox",
		dir = vim.fs.joinpath(vim.fn.stdpath("config"), "/custom-plugins/pdox"),
		cmd = { "Notes" },
		opts = {
			dir = "~/Documents/pdox",
		},
		config = function(_, opts)
			require("pdox").setup(opts)
		end,
	},
}
