local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local React = require(Packages.React)
local ReactRoblox = require(Packages.ReactRoblox)

local State = require(script.Parent["05_State"])

local e = React.createElement

return function(target: Instance): () -> ()
	local element = e(State)

	local root = ReactRoblox.createRoot(target)
	root:render(element)

	return function()
		root:unmount()
	end
end
