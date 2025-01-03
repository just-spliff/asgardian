local colors = require("asgrdian.colors")

local M = {}

M.setup = function(opts)
	opts = opts or {}

	-- Optional configuration: Set background
	if opts.background then
		vim.opt.background = opts.background
	end

	-- Apply highlights
	colors.highlight_groups()

	-- Set the colorscheme name
	vim.g.colors_name = "asgardian"
end

return M
