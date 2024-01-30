local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local React = require(Packages.React)

--[=[
	We can also use state to control the behavior of our components. State is
	managed by the component itself and can be changed by the component. This is
	useful for things like toggling a button or showing a modal.

	We can use the `useState` hook to create state. The `useState` hook returns
	two values: the current state and a function to update the state. We pass in a
	default value to the `useState` hook.

	:::caution
	Keep in mind, the render function of a component should be a pure function.
	This means it can't cause any side effects. This means we can't call the
	`setText` function directly in the render function.

	Remember, that the reason the render function needs to be a pure function is
	because React uses it's pureness to determine if a component needs to be
	re-rendered. If we call `setText` directly in the render function, React will
	see that the render function is not pure and will re-render the component
	every time we update the state. This will cause an infinite loop.
	:::

	@within BasicComponents
]=]
local function StateComponent(): React.ReactNode
	-- We create a state variable called `text` and a function to update the state
	local text, setText = React.useState("Hello, from React!")

	return React.createElement("TextButton", {
		-- We can use the text state to set the text of the button. We use it just
		-- like any other variable or prop.
		Text = text,

		-- We include some basic styling for the button like before.
		Size = UDim2.new(0, 200, 0, 50), -- Size of the component
		Position = UDim2.new(0.5, 0, 0.5, 0), -- Position of the component
		AnchorPoint = Vector2.new(0.5, 0.5), -- Anchor point of the component
		BackgroundColor3 = Color3.fromRGB(255, 255, 255), -- Background color
		TextColor3 = Color3.fromRGB(0, 0, 0), -- Text color

		-- We register an event handler for the Activated event like this. React
		-- will automatically clean up the event handler when the component is
		-- unmounted.
		[React.Event.Activated] = function()
			-- We can use the setText function to update the text state. We can pass
			-- in any value we want to the setText function.

			-- You may be concerned that this is a side effect. However, this is
			-- fine because we are not modifying the state directly within the render
			-- function. All we have done in the render function is register an event
			-- handler. The event handler will be called later when the button is
			-- clicked.
			setText("👋")
		end,
	})
end

return StateComponent
