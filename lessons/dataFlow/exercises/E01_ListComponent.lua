local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local React = require(Packages.React)

--[=[
	@class DataFlowExercises
]=]

-- We have a handy alias again. This is the only one you should need for this
-- exercise.
local e = React.createElement

--[=[
	This is the type of the props that we will pass to the ListComponent. It
	accepts a list of strings. Note that this is exported along with the main
	component.

	.items { string } The list of items to render.

	@interface ListProps
	@within DataFlowExercises
]=]
export type ListProps = {
	items: { string },
}

--[=[
	This is the type of the props that we will pass to the Item component. It
	accepts a label and position. Note that this is not exported because it is
	only used internally by the ListComponent.

	.label string The label to render.
	.position number The position of the item in the list.

	@interface ItemProps
	@within DataFlowExercises
]=]
type ItemProps = {
	label: string,
	position: number,
}

--[=[
	We need to create a new Item component. This component will be responsible for
	rendering a single item in the list. Each will correspond to a single string
	in the list of items and each should know how to render itself based on the
	label and position that it is given.

	This is the first component in this exercise, and we'll need to create the
	ListComponent as well (it can be found below this one). Some of the structure
	of the hierarchical relationship between the two components has been provided
	for you, but you'll need to fill in the rest.

	We'll need to use the label and position props to render the item. The label
	should be rendered as text and the position should be used to help calculate
	the position of the item in the list.

	Here are the steps we should take:
	1. Create a new TextLabel component.
	2. Set the Text property of the TextLabel to the label prop.
	3. Set the Position property of the TextLabel to the position prop.
	  - The position prop is a number that should indicate the order of the item
	    in the list. The first item should be at position 0, the second at
	    position 1, and so on.
	  - We'll need to calculate the position of the item in the list based on the
	    position prop. (One way we can do this by multiplying the position prop by
	    the height of the item.)

	@within DataFlowExercises
]=]
local function Item(props: ItemProps): React.ReactNode
	-- Here is where you'll write your Item rendering code.
end

--[=[
	We need to create a new ListComponent. This component will be responsible for
	rendering the entire list of items. It will be passed a list of strings that
	it should render as a list of Item components.

	This is the second component in this exercise, and we'll need to create the
	Item component as well (it can be found above this one). Some of the structure
	of the hierarchical relationship between the two components has been provided
	for you, but you'll need to fill in the rest.

	We'll need to use the items prop to render the list of items. The items prop
	is a list of strings that we'll need to convert into a list of Item components
	that we can render.

	Here are the steps we should take:
	1. Create a new Frame component (this is done for you).
	2. Somehow iterate over the items prop and create a list of Item components.
	  - We'll need to use the Item component that we created above.
	  - We'll need to pass the label and position props to the Item component.
	3. Pass the list of Item components as the children of the Frame component
	   (this is also done for you).

	@within DataFlowExercises
]=]
local function ListComponent(props: ListProps): React.ReactNode
	-- This is responsible for rendering the entire list.

	-- We'll create a list of items for you. We need to populate it with Item
	-- components.
	local items = {}

	-- Here's where you'll need to write your code to populate the items list.

	-- Then we return a Frame with the list of Item components as children.
	return e("Frame", {
		-- Hopefully we don't try to render too many items and overflow the frame.
		Size = UDim2.fromOffset(200, 400),
		-- We simply pass the list of Item components as the children.
	}, items)
end

return ListComponent
