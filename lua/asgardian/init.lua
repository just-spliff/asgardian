-- lua/gods-theme/init.lua

local config = require("gods-theme.config")

local M = {}

-- Funkcja setup powinna teraz wyglądać tak:
function M.setup(user_opts)
	config.set(user_opts) -- Ustawienia wtyczki
	require("gods-theme").load() -- Załaduj motyw
end

return M
