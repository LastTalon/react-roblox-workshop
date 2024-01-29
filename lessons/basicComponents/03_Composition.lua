local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local Lesson = script.Parent
local React = require(Packages.React)

-- We can import components from other files
local ComposedComponent = require(Lesson["01_Functional"])

--[=[
	Here we are going to compose the component we created in `01_Functional.lua`.

	We can compose components by passing them as children to other components. We
	need to use the createElement function to create the React element for the
	component because React expects us to return rendered React nodes from our
	render function, not the component itself.

	It's that easy! We can compose components by simply passing them as children.
	It doesn't matter if the component is a functional component or a class
	component or a built-in component, we can compose them all the same.

	@within BasicComponents
]=]
local function Composition(): React.ReactNode
	return React.createElement("Frame", {
		-- We add some basic styling to distinguish this component from the composed
		-- component.
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = Color3.fromRGB(0, 0, 255),
	}, {
		-- When we pass children we assign it to the key name we want to use for
		-- this child element. In this case we are using the key name
		-- "ComposedComponent".
		ComposedComponent = React.createElement(ComposedComponent),
	})
end

return Composition
