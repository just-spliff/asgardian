local M = {}

M.apply = function(god)
	-- Ustawienia składni dla różnych bogów
	local syntax = {
		loki = {
			Function = { fg = "#87afff", style = "bold" },
			String = { fg = "#87af87" },
			Type = { fg = "#ffd787", style = "italic" },
			Variable = { fg = "#d7d7d7" },
		},
		thor = {
			Function = { fg = "#61afef", style = "bold" },
			String = { fg = "#98c379" },
			Type = { fg = "#e5c07b", style = "italic" },
			Variable = { fg = "#abb2bf" },
		},
		odyn = {
			Function = { fg = "#7aa2f7", style = "bold" },
			String = { fg = "#9ece6a" },
			Type = { fg = "#e0af68", style = "italic" },
			Variable = { fg = "#c8ccd4" },
		},
	}

	local theme_syntax = syntax[god]
	if not theme_syntax then
		vim.api.nvim_err_writeln("Asgardian: No syntax defined for '" .. god .. "'")
		return
	end

	-- Zastosuj podświetlenie składni
	for group, settings in pairs(theme_syntax) do
		local style = settings.style and " gui=" .. settings.style or ""
		vim.cmd("hi " .. group .. " guifg=" .. settings.fg .. style)
	end
end

return M
