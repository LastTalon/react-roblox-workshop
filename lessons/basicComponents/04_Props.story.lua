local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local React = require(Packages.React)
local ReactRoblox = require(Packages.ReactRoblox)

local Props = require(script.Parent["04_Props"])

local e = React.createElement

return function(target: Instance): () -> ()
	local element = e(Props, {
		-- Try changing the text and color props to see the changes in the label.
		-- We're changing what the component is displaying without changing the
		-- component itself.
		text = "Hello, world!",
		color = Color3.fromRGB(221, 255, 202),
	})

	local root = ReactRoblox.createRoot(target)
	root:render(element)

	return function()
		root:unmount()
	end
end
