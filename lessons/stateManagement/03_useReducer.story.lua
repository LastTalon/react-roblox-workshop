local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local React = require(Packages.React)
local ReactRoblox = require(Packages.ReactRoblox)

local UseReducerComponent = require(script.Parent["03_useReducer"])

local e = React.createElement

return function(target: Instance): () -> ()
	local element = e(UseReducerComponent)

	local root = ReactRoblox.createRoot(target)
	root:render(element)

	return function()
		root:unmount()
	end
end
