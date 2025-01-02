local M = {}

-- Import palet na podstawie nazwy motywu
local function load_palette(theme_name)
	if theme_name == "loki" then
		return require("asgardian.themes.loki").palette
	elseif theme_name == "odyn" then
		return require("asgardian.themes.odyn").palette
	elseif theme_name == "thor" then
		return require("asgardian.themes.thor").palette
	else
		error("Unknown theme: " .. theme_name)
	end
end

-- Mapowanie grup składniowych na kolory dla Loki
local function map_loki(palette)
	return {
		Normal = palette.fg, -- "Przebiegła Zieleń"
		Comment = palette.shadow, -- "Cień Oszustwa"
		String = palette.ember, -- "Żar Chaosu"
		Function = palette.flame, -- "Ogień Oszustwa"
		Keyword = palette.trickery, -- "Zwodnicza Czerwień"
		Variable = palette.mask, -- "Maska"
		Type = palette.mischief, -- "Iluzje"
		Constant = palette.spark, -- "Iskra Chaosu"
		Number = palette.frost, -- "Lodowa Przebiegłość"
		Boolean = palette.venom, -- "Trucizna"
		LineNr = palette.shadow, -- "Cień Oszustwa"
		CursorLineNr = palette.fg, -- "Przebiegła Zieleń"
		Visual = palette.bg_highlight, -- "Przebłysk Iluzji"
		Pmenu = palette.bg_alt, -- "Zmrok"
		PmenuSel = palette.dusk, -- "Zmierzch"
		StatusLine = palette.bg_alt, -- "Zmrok"
		StatusLineNC = palette.bg_dark, -- "Mrok Chaosu"
		DiagnosticError = palette.trickery, -- "Zwodnicza Czerwień"
		DiagnosticWarn = palette.ember, -- "Żar Chaosu"
		DiagnosticInfo = palette.frost, -- "Lodowa Przebiegłość"
		DiagnosticHint = palette.whisper, -- "Szept Chaosu"
	}
end

-- Mapowanie grup składniowych na kolory dla Odyn
local function map_odyn(palette)
	return {
		Normal = palette.fg, -- "Blask Wiedzy"
		Comment = palette.shadow, -- "Cień Wszechwiedzy"
		String = palette.yggdrasil, -- "Yggdrasil"
		Function = palette.wisdom, -- "Światło Wiedzy"
		Keyword = palette.raven, -- "Kruki Hugin i Munin"
		Variable = palette.sacrifice, -- "Ofiara Mądrości"
		Type = palette.runes, -- "Runiczne Błękity"
		Constant = palette.spear, -- "Gungnir"
		Number = palette.frost, -- "Mroźny Blask"
		Boolean = palette.golden_path, -- "Złota Droga"
		LineNr = palette.shadow, -- "Cień Wszechwiedzy"
		CursorLineNr = palette.fg, -- "Blask Wiedzy"
		Visual = palette.bg_highlight, -- "Blask Run"
		Pmenu = palette.bg_alt, -- "Noc Mistyki"
		PmenuSel = palette.eternal_night, -- "Wieczna Noc"
		StatusLine = palette.bg_alt, -- "Noc Mistyki"
		StatusLineNC = palette.bg_dark, -- "Cień Valhalli"
		DiagnosticError = palette.raven, -- "Kruki Hugin i Munin"
		DiagnosticWarn = palette.spear, -- "Gungnir"
		DiagnosticInfo = palette.yggdrasil, -- "Yggdrasil"
		DiagnosticHint = palette.golden_path, -- "Złota Droga"
	}
end

-- Mapowanie grup składniowych na kolory dla Thor
local function map_thor(palette)
	return {
		Normal = palette.fg, -- "Błysk Pioruna"
		Comment = palette.shadow, -- "Cień Grzmotu"
		String = palette.rain, -- "Ulewa"
		Function = palette.mjolnir, -- "Młot Mjöllnir"
		Keyword = palette.thunder, -- "Piorun"
		Variable = palette.roar, -- "Ryk Pioruna"
		Type = palette.sky, -- "Rozjaśnione Niebo"
		Constant = palette.sparks, -- "Iskry"
		Number = palette.courage, -- "Odwaga"
		Boolean = palette.earth, -- "Ziemia Uderzenia"
		LineNr = palette.shadow, -- "Cień Grzmotu"
		CursorLineNr = palette.fg, -- "Błysk Pioruna"
		Visual = palette.bg_highlight, -- "Błysk Grzmotu"
		Pmenu = palette.bg_alt, -- "Nawałnica"
		PmenuSel = palette.tempest, -- "Nawałnica"
		StatusLine = palette.bg_alt, -- "Nawałnica"
		StatusLineNC = palette.bg_dark, -- "Głęboki Mrok"
		DiagnosticError = palette.roar, -- "Ryk Pioruna"
		DiagnosticWarn = palette.sparks, -- "Iskry"
		DiagnosticInfo = palette.sky, -- "Rozjaśnione Niebo"
		DiagnosticHint = palette.cloud, -- "Chmury"
	}
end

-- Funkcja wybierająca mapowanie na podstawie motywu
local function map_colors(theme_name, palette)
	if theme_name == "loki" then
		return map_loki(palette)
	elseif theme_name == "odyn" then
		return map_odyn(palette)
	elseif theme_name == "thor" then
		return map_thor(palette)
	else
		error("Unknown theme: " .. theme_name)
	end
end

-- Funkcja ustawiająca kolory podświetlania składni
function M.set_syntax(theme_name)
	local palette = load_palette(theme_name)
	local group_colors = map_colors(theme_name, palette)

	for group, color in pairs(group_colors) do
		vim.api.nvim_set_hl(0, group, { fg = color, bg = palette.bg or "#000000" })
	end
end

return M
