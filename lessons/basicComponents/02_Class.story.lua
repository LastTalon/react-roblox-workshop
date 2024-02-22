local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local React = require(Packages.React)
local ReactRoblox = require(Packages.ReactRoblox)

local Class = require(script.Parent["02_Class"])

local e = React.createElement

return function(target: Instance): () -> ()
	local element = e(Class)

	local root = ReactRoblox.createRoot(target)
	root:render(element)

	return function()
		root:unmount()
	end
end
