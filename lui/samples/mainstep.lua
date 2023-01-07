package.cpath = package.cpath..";./?.dll;./?.so;./?.dylib;"
lui = require "liblui"

lui.init()

win = lui.window("Mainstep Test", {
	onclosing = function() lui.quit() return true end,
	visible = true
})

-- tell lui that we want our own main loop
lui.mainsteps()

-- and then loop
while lui.mainstep() do
	-- some other processing, like polling stuff etc
end
