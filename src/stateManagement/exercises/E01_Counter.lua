local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local React = require(Packages.React)

-- We've created some handy aliases to make things easier
local e = React.createElement
local useReducer = React.useReducer
local useState = React.useState

--[=[
	@class StateManagementExercises
]=]

type ButtonProps = {
	text: string?,
	onClick: () -> ()?,
}

-- This is our basic button component from the prior lesson.
local function BasicButton(props: ButtonProps): React.ReactNode
	return e("TextButton", {
		Text = props.text or "Button",

		-- We've modified the size and position to be more reasonable.
		Size = UDim2.fromScale(1, 0.5),
		Position = UDim2.fromScale(0, 0.5),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255), -- Background color
		TextColor3 = Color3.fromRGB(0, 0, 0), -- Text color

		[React.Event.Activated] = props.onClick,
	})
end

--[=[
	We need to create a counter component that uses state. It should have one
	button to increment the counter and one label to display the value of the
	counter. The counter should start at 0 and increment by 1 each time the
	button is clicked.

	We can reuse the BasicButton component from the prior lesson. It will make
	things a bit easier through composition since we won't have to worry about how
	it's doing its job.

	We'll need to use either the `useState` or `useReducer` hook to create some
	state to use in our component. Either approach will work, but for an extra
	challenge, try doing both.

	Here are the steps we should take:
	1. Create a state value to hold the counter value.
		- We can use either `useState` or `useReducer` to do this.
		- This should be in the top-level of the component.
	2. Create our sub-components.
		- We'll need a button to increment the counter.
		- We'll need a label to display the counter value.
		- We can use the `BasicButton` component included above to help.
	3. Hook up the sub-components to the state.
		- The button should increment the counter when clicked.
		- The label should display the current value of the counter.
	4. Write the state incrementing logic.
	  - If we're using `useState`, we'll need to use the set function returned
	    from the hook.
		- If we're using `useReducer`, we'll need to dispatch an action and write a
		  reducer function to handle the action.

	@within StateManagementExercises
]=]
local function Counter(): React.ReactNode
	-- We'll need to somehow create some state to use here.

	-- We'll create a frame to contain our counter components.
	return e("Frame", {
		Size = UDim2.fromOffset(200, 100),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
	}, {
		-- Here we need to create our counter components. They'll need to use and
		-- update the state we created above.
	})
end

return Counter
