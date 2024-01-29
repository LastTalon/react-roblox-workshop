local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local React = require(Packages.React)

local e = React.createElement
local useEffect = React.useEffect
local useState = React.useState

--[=[
	What if we want to do something when our component is first rendered? Or what
	if we want to do something when our component is destroyed? Or perhaps we want
	to do something when a prop changes or we need to cause some side effect.

	These are all examples of side effects that are easy to do in a class
	component, but are a bit more unclear how to achieve in a function component.
	React provides a hook called `useEffect` that allows us to do all of these.

	@within StateManagement
]=]
local function EffectDisplay(): React.ReactNode
	-- First we'll do something when our component is first rendered.
	useEffect(function()
		-- We pass a function to `useEffect`. This function can do anything we want
		-- including any side effects we normally would not be able to do in our
		-- pure render function. Printing is technically a side effect, so we'll
		-- print a message to the output.
		print("MessageDisplay was rendered!")

		-- Here we pass an empty table. This tells React that we don't want to
		-- re-run this effect unless the dependencies change. Since we passed an
		-- empty table, these dependencies will never change and this effect will
		-- only run once when the component is first rendered.
	end, {})

	local message, setMessage = useState("Hello, world!")

	-- Next we'll do something when our component is destroyed.
	useEffect(function()
		-- When we return a function from our effect, React will call that function
		-- when our component has re-rendered with this effect again. This is useful
		-- for cleaning up any side effects we may have created since React isn't
		-- aware of them and won't clean them up for us.
		return function()
			-- Again we'll print a message to the output.
			print("MessageDisplay was destroyed!")
		end

		-- Again we pass an empty table to tell React that we don't want to re-run
		-- this effect unless the dependencies change. Since we passed an empty
		-- table, these dependencies will never change and this effect will only run
		-- once when the component is first rendered. This means that the function
		-- we returned will only be called when the component is destroyed, since
		-- that is the only time this effect's dependencies will be re-evaluated.
	end, {})

	-- We can also do something when some value changes.
	useEffect(function()
		-- We'll print a message to the output.
		print("MessageDisplay's message changed to: ", message)

		-- Again we pass a table, but this time we'll pass the value of our message
		-- state variable. This tells React that we only want to re-run this effect
		-- when the value of our message state variable changes. Typically if you
		-- close over a value in a function, you need to pass it as a dependency. If
		-- you don't, the value will be stale and you may run into bugs.
	end, { message })

	return e("Frame", {
		-- Let's make our message display easy to see
		Size = UDim2.fromOffset(200, 100),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
	}, {
		TextInput = React.createElement("TextBox", {
			PlaceholderText = "Enter a message",

			-- Position this one above the center of the frame
			Size = UDim2.fromScale(1, 0.5),
			Position = UDim2.fromScale(0, 0),

			[React.Change.Text] = function(newText: string)
				setMessage(newText)
			end,
		}),
		DisplayLabel = React.createElement("TextLabel", {
			Text = message,

			-- Position this one below the center of the frame
			Size = UDim2.fromScale(1, 0.5),
			Position = UDim2.fromScale(0, 0.5),
		}),
	})
end

return EffectDisplay
