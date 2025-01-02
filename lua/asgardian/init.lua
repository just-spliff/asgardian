local config = require("asgardian.config")
local utils = require("asgardian.utils")

local M = {}

function M.load()
	local theme = require("asgardian.gods." .. config.options.theme)
	local colors = theme.get_colors()

	if config.options.transparent then
		colors.bg = "NONE"
	end

	-- Definicje grup
	local highlights = {
		Normal = { bg = colors.bg, fg = colors.fg },
		Comment = { fg = colors.comment, italic = true },
		Keyword = { fg = colors.keyword, bold = true },
		String = { fg = colors.string },
		Error = { fg = colors.error, bold = true },
	}

	-- Zastosuj kolory
	utils.set_highlights(highlights)
end

return M
