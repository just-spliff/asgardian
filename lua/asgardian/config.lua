local M = {}

-- Domyślna konfiguracja
M.config = {
	god = "thor", -- Domyślny motyw
	transparent = false, -- Domyślne tło
}

M.setup = function(opts)
	M.config = vim.tbl_deep_extend("force", M.config, opts or {})
end

return M
