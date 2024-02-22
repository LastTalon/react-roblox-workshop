local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local React = require(Packages.React)
local ReactRoblox = require(Packages.ReactRoblox)

local BasicButton = require(script.Parent["E01_BasicButton"])

local e = React.createElement

return function(target: Instance): () -> ()
	local element = e(BasicButton, {
		text = "Hello, world!",

		onClick = function()
			print("Button clicked!")
		end,
	})

	local root = ReactRoblox.createRoot(target)
	root:render(element)

	return function()
		root:unmount()
	end
end
