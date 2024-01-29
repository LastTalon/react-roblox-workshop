local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local React = require(Packages.React)

--[=[
	@class BasicComponentExercises
]=]

--[=[
	We'll get you started with the type definition for the props you'll need.

	.text string? -- The text to display on the button
	.onClick (() -> ())? -- The callback to fire when the button is clicked

	@interface Props
	@within BasicComponentExercises
]=]
export type Props = {
	text: string?,
	onClick: () -> ()?,
}

--[=[
	And here's an empty function to get started with the component implementation.

	We need to create a basic button component that takes in props for a label and
	an `onClick` callback.

	We want to return a `TextButton` with the label as its text, and the `onClick`
	callback as its `Activated` event.

	Here are the steps we should take:
	1. Create a `TextButton` and return it from our component.
	2. Set the `Text` property of the button to the `text` prop.
		- Remember that we can access props like `props.text`.
		- We may want to provide a default value for the Button's label, since the
		  `text` prop is optional.
	3. Set the `Activated` event of the button to the `onClick` prop.
	  - Like we saw in the lesson examples, we can register events in React by
	    passing a special prop such as `React.Event.Activated`.

	@within BasicComponentExercises
]=]
local function BasicButton(props: Props): React.ReactNode
	return React.createElement("TextButton", {
		-- Here is where the majority of your work will be done. Much of writing
		-- functional React components is translating the props you receive into
		-- the properties of the elements you return.
	})
end

-- And finally, we'll return the component so it can be used elsewhere.
return BasicButton
