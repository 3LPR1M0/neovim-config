require('config.options')
require('config.binds')
require('config.lazy')
local function theme_by_time()
	local hour = tonumber(os.date("%H"))

	if hour >= 6 and hour < 12 then
		vim.cmd.colorscheme("gruvbox") -- morning
	elseif hour >= 12 and hour < 18 then
		vim.cmd.colorscheme("gruber-darker") -- afternoon
	elseif hour >= 18 and hour < 21 then
		vim.cmd.colorscheme("rose-pine") -- evening
	else
		vim.cmd.colorscheme("rose-pine") -- late night
	end
end

theme_by_time()
