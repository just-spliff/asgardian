local M = {}

M.colors = {
	-- Define your palette
	background = "#2E3440",
	foreground = "#D8DEE9",
	comment = "#4C566A",
	keyword = "#81A1C1",
	string = "#A3BE8C",
	function_name = "#8FBCBB",
	error = "#BF616A",
}

M.highlight_groups = function()
	local colors = M.colors

	-- Define highlight groups
	vim.api.nvim_set_hl(0, "Normal", { fg = colors.foreground, bg = colors.background })
	vim.api.nvim_set_hl(0, "Comment", { fg = colors.comment, bg = "NONE", italic = true })
	vim.api.nvim_set_hl(0, "Keyword", { fg = colors.keyword, bg = "NONE", bold = true })
	vim.api.nvim_set_hl(0, "Function", { fg = colors.function_name, bg = "NONE" })
	vim.api.nvim_set_hl(0, "String", { fg = colors.string, bg = "NONE" })
	vim.api.nvim_set_hl(0, "Error", { fg = colors.error, bg = "NONE", bold = true })
end

return M
