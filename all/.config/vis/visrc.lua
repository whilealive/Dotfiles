-- ==================================================================
-- FILE     .visrc.lua
-- INFO     vis configuration file
--
-- DATE     04.04.2017
-- OWNER    Bischofberger
-- ==================================================================

-- load standard vis module, providing parts of the Lua API
require('vis')

vis.events.subscribe(vis.events.INIT, function()
	-- Your global configuration options
end)

vis.events.subscribe(vis.events.WIN_OPEN, function(win)
	-- per window configuration options
  vis:command('set number')
  vis:command('set cursorline')
  vis:command('set tabwidth 2')
  vis:command('set expandtab')
  vis:command('set autoindent')
end)
