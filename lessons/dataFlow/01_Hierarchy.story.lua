local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local React = require(Packages.React)
local ReactRoblox = require(Packages.ReactRoblox)

local Hierarchy = require(script.Parent["01_Hierarchy"])

local e = React.createElement

return function(target: Instance): () -> ()
	local element = e(Hierarchy)

	local root = ReactRoblox.createRoot(target)
	root:render(element)

	return function()
		root:unmount()
	end
end
