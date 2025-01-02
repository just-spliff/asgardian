local M = {}

function M.apply_highlight(group, styles)
	local command = "highlight " .. group
	if styles.fg then
		command = command .. " guifg=" .. styles.fg
	end
	if styles.bg then
		command = command .. " guibg=" .. styles.bg
	end
	if styles.gui then
		command = command .. " gui=" .. styles.gui
	end
	vim.cmd(command)
end

return M
