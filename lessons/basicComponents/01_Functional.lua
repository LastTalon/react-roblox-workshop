local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local React = require(Packages.React)

--[=[
	@class BasicComponents
]=]

--[=[
	We can create a functional component by creating a function that returns a
	React element.

	Functional components are the simplest way to create a component in React.

	They are also known as "stateless" components because they do not have any
	state associated with them.

	:::note
	The return type of the function is React.ReactNode. This is the type that
	React uses to construct your UI and is the type that all React elements share.
	:::

	@within BasicComponents
]=]
local function FunctionalComponent(): React.ReactNode
	-- We return a new React element
	return React.createElement("TextLabel", {
		Text = "Hello, from React!", -- The text to display

		-- Example of adding basic styling
		Size = UDim2.new(0, 200, 0, 50), -- Size of the component
		Position = UDim2.new(0.5, 0, 0.5, 0), -- Position of the component
		AnchorPoint = Vector2.new(0.5, 0.5), -- Anchor point of the component
		BackgroundColor3 = Color3.fromRGB(255, 255, 255), -- Background color
		TextColor3 = Color3.fromRGB(0, 0, 0), -- Text color
	})
end

-- Export the component so we can use it elsewhere
return FunctionalComponent
