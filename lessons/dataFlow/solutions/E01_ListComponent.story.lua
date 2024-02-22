local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local React = require(Packages.React)
local ReactRoblox = require(Packages.ReactRoblox)

local ListComponent = require(script.Parent["E01_ListComponent"])

local e = React.createElement

return function(target: Instance): () -> ()
	local element = e(ListComponent, {
		-- Try modifying this list to see how the component behaves.
		items = {
			"Item 1",
			"Item 2",
			"Item 3",
			"Item 4",
			"Item 5",
		},
	})

	local root = ReactRoblox.createRoot(target)
	root:render(element)

	return function()
		root:unmount()
	end
end
