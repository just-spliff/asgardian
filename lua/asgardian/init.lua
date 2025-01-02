local config = require("asgardian.config")
local M = {}

-- Domyślny motyw
local current_theme = "loki" -- Zmienna przechowująca wybrany motyw

M.setup = function(opts)
	opts = opts or {}

	-- Zmień motyw na podstawie ustawienia (możesz zmienić to dynamicznie)
	current_theme = opts.theme or current_theme -- Pozwala na zmianę motywu przez użytkownika

	-- Załaduj odpowiednią paletę kolorów dla wybranego motywu
	local colors = require("asgardian.themes")[current_theme]
	local highlights = require("asgardian.groups.syntax").setup(colors)
	-- local dashboard = require("asgardian.groups.integrations.dashboard-nvim").setup(colors)

	-- Zastosuj grupy podświetlania
	for group, settings in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, settings)
	end

	-- for group, settings in pairs(dashboard) do
	-- 	vim.api.nvim_set_hl(0, group, settings)
	-- end

	-- Zastosuj dodatkowe opcje konfiguracyjne (opcjonalne)
	require("asgardian.config").apply(opts)
	-- require("asgardian.groups.integrations.treesitter")

	config.apply_transparency()
end

M.set_theme = function(theme)
	-- Funkcja do dynamicznej zmiany motywu
	current_theme = theme
	M.setup({ theme = theme })
end

return M
