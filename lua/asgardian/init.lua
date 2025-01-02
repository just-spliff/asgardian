local config = require("asgardian.config")
local M = {}

M.setup = function(opts)
	config.setup(opts)

	local god = config.config.god:lower()
	local transparent = config.config.transparent

	-- Wczytaj wybranego "boga"
	local success, theme = pcall(require, "asgardian.gods." .. god)
	if not success then
		vim.api.nvim_err_writeln("Asgardian: Invalid god theme '" .. god .. "'")
		return
	end

	-- Załaduj motyw
	theme.load(transparent)

	-- Dynamiczne ustawienia składni
	require("asgardian.syntax").apply(god)
end

return M
