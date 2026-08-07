package.cpath = package.cpath..";./?.dll;./?.so;./?.dylib;"
lui = require "liblui"

lui.init()

win = lui.window("Simple Sample", 400, 300, false, {
	onclosing = function() lui.quit() return true end,
	visible = true
})

-- Create a vertical box layout
local vbox = lui.vbox()
win:setchild(vbox, true)

-- Add a label
vbox:append(lui.label("Hello, World!"))

-- Add an entry field
local entry = vbox:append(lui.entry(), true)
entry.text = "Type something here"

-- Add a button with a callback
local btn = vbox:append(lui.button("Click me"), true)
btn.onclicked = function(b)
	lui.msgbox(win, "Button Clicked!", b.text)
end

-- Add a separator
vbox:append(lui.hseparator())

-- Add a multiline entry
local mle = vbox:append(lui.multilineentry(true), true)
mle.text = "This is a multiline\nentry field."

lui.main()

lui.finalize()
