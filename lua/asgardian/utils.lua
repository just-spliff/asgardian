local M = {}

function M.set_highlights(highlights)
	for group, styles in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, styles)
	end
end

return M
