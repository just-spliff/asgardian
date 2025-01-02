-- ~/.config/nvim/lua/asgardian/init.lua
local M = {}

-- Ładowanie tematu (motywu)
local function load_theme(theme)
	local theme_path = "asgardian.themes." .. theme
	local ok, theme_module = pcall(require, theme_path)

	if not ok then
		-- Jeśli temat nie istnieje, wczytujemy domyślny temat "odyn"
		theme_module = require("asgardian.themes.odyn")
	end

	return theme_module.palette
end

-- Funkcja konfiguracji
M.setup = function(opts)
	opts = opts or {}

	-- Wybór motywu
	local current_theme = opts.theme or "odyn" -- Domyślnie "odyn"
	local colors = load_theme(current_theme)

	-- Transparentne tło, jeśli opcja jest włączona
	if opts.transparent_background then
		vim.cmd("hi Normal guibg=NONE")
		vim.cmd("hi NonText guibg=NONE")
		vim.cmd("hi EndOfBuffer guibg=NONE")
	end

	-- Zastosowanie kolorów
	local highlights = {
		Normal = { fg = colors.fg, bg = colors.bg },
		-- Możesz dodać inne grupy highlight np. komentarze, zmienne
	}

	-- Zastosowanie grup highlight w Neovim
	for group, settings in pairs(highlights) do
		vim.api.nvim_set_hl(0, group, settings)
	end
end

return M
