local M = {}

-- Domyślne ustawienia
M.options = {
	theme = "loki", -- Motywy: loki, thor, odyn
	transparent = false,
}

function M.set(user_opts)
	M.options = vim.tbl_extend("force", M.options, user_opts or {})
end

return M
