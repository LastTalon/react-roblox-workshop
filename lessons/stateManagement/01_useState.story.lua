local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local React = require(Packages.React)
local ReactRoblox = require(Packages.ReactRoblox)

local UseStateComponent = require(script.Parent["01_useState"])

local e = React.createElement

return function(target: Instance): () -> ()
	local element = e(UseStateComponent)

	local root = ReactRoblox.createRoot(target)
	root:render(element)

	return function()
		root:unmount()
	end
end
