local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local React = require(Packages.React)
local ReactRoblox = require(Packages.ReactRoblox)

local LiftStateUp = require(script.Parent["02_LiftStateUp"])

local e = React.createElement

return function(target: Instance): () -> ()
	local element = e(LiftStateUp)

	local root = ReactRoblox.createRoot(target)
	root:render(element)

	return function()
		root:unmount()
	end
end
