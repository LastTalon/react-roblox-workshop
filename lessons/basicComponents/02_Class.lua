local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local React = require(Packages.React)

--[=[
	We can create a class component by creating a class that extends from
	React.Component.

	Class components are the legacy method of creating components in React. You
	may see them in older codebases, but they are not recommended for new code.

	They are also known as "stateful" components because they intrinsically have
	state associated with them.

	@prop ClassComponent Component
	@within BasicComponents
]=]
local ClassComponent = React.Component:extend("ClassComponent")

-- We can define the render method of our class component to return a React
-- element just like we did in the functional component.
function ClassComponent:render(): React.ReactNode
	-- We do the exact same thing here as we did in the functional component.

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

return ClassComponent
