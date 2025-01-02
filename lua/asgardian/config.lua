-- ~/.config/nvim/lua/asgardian/config.lua
local asgardian = require("asgardian")

-- Ustawienie motywu "thor" z transparentnym tłem
asgardian.setup({
	theme = "thor", -- Wybór tematu: "thor", "loki", "odyn"
	transparent_background = true, -- Włączenie transparentnego tła
})
