local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local React = require(Packages.React)

-- Let's define a type for our props
export type Props = {
	-- We want to accept a string to use as the text for our label.
	text: string?,
	-- We want to accept a color to use as the background color for our label.
	color: Color3?,
}

--[=[
	We create a functional component that accepts props as an argument. We can
	then use the props to set the text and background color of the label.

	Props are passed to the component as a table. We can access the props the same
	as any plain old data. For example, if we wanted to access the text prop, we
	could do so like this: `props.text`.

	:::caution
	It's important to note that props are read-only. We cannot modify the props
	table. If we want to modify the props, we need to create a new table and
	assign it to the props variable.

	This is for two reasons:
	1. The render function of a component should be a pure function. This means it
	can't cause any side effects.
	2. React uses the props table to determine if a component needs to be
	re-rendered. If we modify the props table, React will think the props are the
	same and will not re-render the component. This is why the render function
	needs to be a pure function.
	:::

	@within BasicComponents
]=]
local function PropsComponent(props: Props): React.ReactNode
	return React.createElement("TextLabel", {
		-- We can use the text prop to set the text of the label. If the prop is not
		-- provided, we can use a default value.
		Text = props.text or "Hello, from React!",

		-- We include some basic styling for the label like before.
		Size = UDim2.new(0, 200, 0, 50), -- Size of the component
		Position = UDim2.new(0.5, 0, 0.5, 0), -- Position of the component
		AnchorPoint = Vector2.new(0.5, 0.5), -- Anchor point of the component
		TextColor3 = Color3.fromRGB(0, 0, 0), -- Text color

		-- We can use the color prop to set the background color of the label.
		BackgroundColor3 = props.color or Color3.fromRGB(255, 255, 255),
	})
end

return PropsComponent
