local options = require("gods-theme.config").options

local variants = {
	thor = {
		_nc = "#1f1f28", -- Ciemne tło
		base = "#2c2a3e", -- Głębokie tło
		surface = "#3a375f", -- Mroczny odcień
		overlay = "#4b4a6e", -- Przezroczystość z odcieniem szarości
		muted = "#7a5f44", -- Złoty odcień
		subtle = "#8e7b5e", -- Złoty akcent
		text = "#e8d7b9", -- Jasny kolor tekstu
		love = "#e96a72", -- Czerwony akcent
		gold = "#f9b84a", -- Złoty akcent
		rose = "#e68b8a", -- Czerwony odcień
		pine = "#9b7b56", -- Odcień zieleni
		foam = "#A1b8c9", -- Niebieska zieleń
		iris = "#c7a8d1", -- Fioletowy akcent
		leaf = "#a8a24f", -- Ziemisty kolor
		highlight_low = "#4c4a68", -- Mroczny akcent
		highlight_med = "#5e5b7f", -- Subtelne podświetlenie
		highlight_high = "#746a8f", -- Jasne podświetlenie
		none = "NONE",
	},

	loki = {
		_nc = "#1a1b25", -- Bardzo ciemne tło
		base = "#21222b", -- Głębokie tło
		surface = "#2f2f3d", -- Mroczny odcień
		overlay = "#3e3e4a", -- Przyciemniony szary
		muted = "#5b5f66", -- Zimna zieleń
		subtle = "#7a7876", -- Zimny, szaro-zielony akcent
		text = "#b1b7c2", -- Szaro-biały tekst
		love = "#9f7f60", -- Ciepły akcent
		gold = "#7f9c4b", -- Akcent złoty
		rose = "#bc8f93", -- Różowy akcent
		pine = "#4c6b5c", -- Chłodny zielony
		foam = "#3b5f6c", -- Głęboki niebieski
		iris = "#74679b", -- Fioletowy
		leaf = "#6e6d4f", -- Ziemisty, ciemny odcień
		highlight_low = "#343646", -- Ciemne podświetlenie
		highlight_med = "#4b4b5f", -- Średnie podświetlenie
		highlight_high = "#6f6e80", -- Jasne podświetlenie
		none = "NONE",
	},

	odyn = {
		_nc = "#282c34", -- Bardzo ciemne tło
		base = "#313240", -- Ziemiste tło
		surface = "#3a3e48", -- Mroczne szarości
		overlay = "#4b4f58", -- Ciemny szary
		muted = "#6e6e58", -- Zgaszona zieleń
		subtle = "#7c7c6b", -- Przyciemniony złoto-zielony
		text = "#d0d0d0", -- Jasny tekst
		love = "#c25543", -- Odcień czerwony
		gold = "#d98f34", -- Złoty akcent
		rose = "#db7070", -- Różowy akcent
		pine = "#4f7056", -- Zieleń lasu
		foam = "#669b9f", -- Chłodna zieleń
		iris = "#9b89d1", -- Fioletowy
		leaf = "#8a7f4d", -- Mściwa zieleń
		highlight_low = "#4c5159", -- Ciemne podświetlenie
		highlight_med = "#5d616a", -- Średnie podświetlenie
		highlight_high = "#777c87", -- Jasne podświetlenie
		none = "NONE",
	},
}

if options.palette ~= nil and next(options.palette) then
	-- handle variant specific overrides
	for variant_name, override_palette in pairs(options.palette) do
		if variants[variant_name] then
			variants[variant_name] = vim.tbl_extend("force", variants[variant_name], override_palette or {})
		end
	end
end

if variants[options.variant] ~= nil then
	return variants[options.variant]
end

return vim.o.background == "light" and variants.dawn or variants[options.dark_variant or "thor"]
