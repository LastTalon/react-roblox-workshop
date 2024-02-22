local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local React = require(Packages.React)

--[=[
	@class StateManagement
]=]

-- Let's create some handy aliases for React.createElement and friends
local e = React.createElement
local useState = React.useState

--[=[
	Let's create a component that displays a message. We'll also create a text
	input that allows us to change the message.

	We'll use the `useState` hook to store the message in a state variable. We'll
	also use the [React.Change.Text] prop to listen to the text input's change
	event.

	From this example you can see how we can use state to pass data between
	multiple components. State is often passed up and down the component tree
	through props and event handlers. This is called "lifting state up". In this
	example we can see that the message is stored in the MessageDisplay component
	and passed down to the TextInput and DisplayLabel components. If we stored the
	message in the TextInput component, we wouldn't be able to display it in the
	DisplayLabel component.

	@within StateManagement
]=]
local function MessageDisplay(): React.ReactNode
	-- Here we'll create a state variable to store our message in.
	local message, setMessage = useState("Hello, world!")

	-- We'll nest a few elements inside of our component.
	return e("Frame", {
		-- Let's make our message display easy to see
		Size = UDim2.fromOffset(200, 100),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
	}, {
		TextInput = React.createElement("TextBox", {
			Text = message,
			PlaceholderText = "Enter a message",

			-- Position this one above the center of the frame
			Size = UDim2.fromScale(1, 0.5),
			Position = UDim2.fromScale(0, 0),
			BackgroundColor3 = Color3.fromRGB(255, 255, 255),

			-- If we want to listen to a change event, we get another special prop to
			-- pass in: [React.Change.<EventName>]
			[React.Change.Text] = function(instance: TextBox)
				-- All we need to do is call the setter function to update the state
				setMessage(instance.Text)
			end,
		}),
		DisplayLabel = React.createElement("TextLabel", {
			-- Here we'll use the value of our state variable to set the label's text.
			Text = message,

			-- Position this one below the center of the frame
			Size = UDim2.fromScale(1, 0.5),
			Position = UDim2.fromScale(0, 0.5),
			BackgroundColor3 = Color3.fromRGB(213, 213, 213),
		}),
	})
end

return MessageDisplay
