-- asgardian/init.lua
local M = {}

-- Funkcja do wczytania odpowiedniego pliku tematu
local function load_theme(theme)
	local theme_path = "asgardian.themes." .. theme
	local ok, theme_module = pcall(require, theme_path)

	if not ok then
		-- Jeśli motyw nie istnieje, domyślnie wczytujemy motyw "odyn"
		theme_module = require("asgardian.themes.odyn")
	end

	return theme_module.palette
end

-- Funkcja do ustawienia grup highlight na podstawie motywu
function M.setup_highlights(colors)
	return {
		Normal = { fg = colors.fg, bg = colors.bg },
		-- Możesz zdefiniować inne grupy highlight, jak np. dla komentarzy, zmiennych itd.
	}
end

-- Funkcja do aplikowania konfiguracji
function M.apply_options(opts)
	-- Możesz dodać inne opcje konfiguracyjne, jak integracje z wtyczkami itd.
end

-- Główna funkcja konfiguracji
M.setup = function(opts)
	opts = opts or {}

	-- Wybór tematu
	local current_theme = opts.theme or "odyn" -- Domyślnie odyn
	local colors = load_theme(current_theme)

	-- Zastosowanie grup highlight
	local highlights = M.setup_highlights(colors)
	for group, settings in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, settings)
	end

	-- Zastosowanie opcji konfiguracyjnych
	M.apply_options(opts)
end

return M
