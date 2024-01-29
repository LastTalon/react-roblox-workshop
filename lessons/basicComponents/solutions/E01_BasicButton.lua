local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local React = require(Packages.React)

export type Props = {
	text: string?,
	onClick: () -> ()?,
}

local function BasicButton(props: Props): React.ReactNode
	return React.createElement("TextButton", {
		-- We want a default label if none is provided
		Text = props.text or "Button",

		-- Include some basic styling so we can see the component better
		Size = UDim2.new(0, 200, 0, 50), -- Size of the component
		Position = UDim2.new(0.5, 0, 0.5, 0), -- Position of the component
		AnchorPoint = Vector2.new(0.5, 0.5), -- Anchor point of the component
		BackgroundColor3 = Color3.fromRGB(255, 255, 255), -- Background color
		TextColor3 = Color3.fromRGB(0, 0, 0), -- Text color

		-- We want to call the onClick function when the button is clicked. If no
		-- function is provided, we don't want to do anything; nil will be passed,
		-- which is a no-op.
		[React.Event.Activated] = props.onClick,
	})
end

return BasicButton
