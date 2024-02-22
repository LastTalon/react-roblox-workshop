local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local React = require(Packages.React)

local e = React.createElement

export type ListProps = {
	items: { string },
}

type ItemProps = {
	label: string,
	position: number,
}

local function Item(props: ItemProps): React.ReactNode
	-- This is only responsible for rendering a single item in the list.

	-- We make a new TextLabel for each item in the list.
	return e("TextLabel", {
		-- We use the label as the text. We don't have a default this time because
		-- `props.label` is no longer optional.
		Text = props.label,
		-- Each item is 24 pixels tall.
		Size = UDim2.new(1, 0, 0, 24),
		-- We use the position to calculate the Y position of the item. As an
		-- additional challenge you could try to use a UIListLayout instead of
		-- manually positioning each item.
		Position = UDim2.fromOffset(0, props.position * 24),

		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	})
end

local function ListComponent(props: ListProps): React.ReactNode
	-- This is responsible for rendering the entire list.

	-- We first create a list of Item components.
	local items = {}
	-- We iterate over the list of items passed in as props.
	for index, item in props.items do
		-- And we create an Item component for each item in the list.
		items[index] = e(Item, {
			-- We pass the label and position as props to the Item component.
			label = item,
			-- We use the index to calculate the position of the item. In this case,
			-- we subtract 1 from the index because the first item should be at
			-- position 0 (no offset) and Luau is 1-indexed.
			position = index - 1,
		})
	end

	-- Then we return a Frame with the list of Item components as children.
	return e("Frame", {
		-- Hopefully we don't try to render too many items and overflow the frame.
		Size = UDim2.new(0, 200, 1, 0),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),

		BackgroundColor3 = Color3.fromRGB(255, 255, 255),

		-- We simply pass the list of Item components as the children.
	}, items)
end

return ListComponent
