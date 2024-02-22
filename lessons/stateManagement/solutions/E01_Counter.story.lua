local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local React = require(Packages.React)
local ReactRoblox = require(Packages.ReactRoblox)

local Counters = require(script.Parent["E01_Counter"])

local e = React.createElement

return function(target: Instance): () -> ()
	local element = e(Counters.StateCounter)
	-- local element = e(Counters.ReducerCounter)

	local root = ReactRoblox.createRoot(target)
	root:render(element)

	return function()
		root:unmount()
	end
end
