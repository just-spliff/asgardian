local config = require("asgardian.config")

-- Ustawienia użytkownika
local M = {}

function M.setup(user_opts)
	config.set(user_opts)
	require("asgardian").load()
end

return M
