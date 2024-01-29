local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local React = require(Packages.React)

local e = React.createElement
local useReducer = React.useReducer
local useState = React.useState

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

-- Our first solution will use `useState` to manage state.
local function StateCounter(): React.ReactNode
	-- First we need to create a state variable.
	local count, setCount = useState(0)

	-- We'll create a frame to contain our counter components.
	return e("Frame", {
		Size = UDim2.fromOffset(200, 100),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
	}, {
		DisplayLabel = e("TextLabel", {
			-- Here we'll use the value of our state variable to set the label's text.
			-- We should convert it to a string first, since it's a number.
			Text = tostring(count),

			-- Position this one above the center of the frame
			Size = UDim2.fromScale(1, 0.5),
			Position = UDim2.fromScale(0, 0),
		}),
		IncrementButton = e(BasicButton, {
			text = "Increment",

			-- Our button's onClick handler will update the state variable.
			onClick = function()
				-- Here we need to update the state variable based on its previous
				-- value. We can do this by passing a function to setCount rather than
				-- a value directly.
				setCount(function(state: number): number
					return state + 1
				end)
			end,
		}),
	})
end

-- Our second solution will use `useReducer` to manage state.
local function ReducerCounter(): React.ReactNode
	-- First we'll create some types.
	type Action = {
		-- We only need one type and no payload for this.
		type: "increment",
	}

	type State = {
		-- We only need to track our count.
		count: number,
	}

	-- Next we need to create our reducer.
	local count, dispatchCount = useReducer(function(state: State, action: Action): State
		-- We check the action type to see what we need to do.
		if action.type == "increment" then
			-- We'll return a new state object with the count incremented.
			return {
				count = state.count + 1,
			}
		end

		-- If we don't recognize the action type, we'll just return the current
		-- state.
		return state
	end, {
		-- We need to pass an initial state value to useReducer. We want it to start
		-- at 0.
		count = 0,
	})

	-- We'll create a frame to contain our counter components.
	return e("Frame", {
		Size = UDim2.fromOffset(200, 100),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
	}, {
		DisplayLabel = e("TextLabel", {
			-- Here we'll use the value of our state variable to set the label's text.
			-- We should convert it to a string first, since it's a number.
			Text = tostring(count.count),

			-- Position this one above the center of the frame
			Size = UDim2.fromScale(1, 0.5),
			Position = UDim2.fromScale(0, 0),
		}),
		IncrementButton = e(BasicButton, {
			text = "Increment",

			-- Our button's onClick handler will update the state variable.
			onClick = function()
				-- Here we only need to dispatch an action. There is no need for any
				-- special logic to update the state, our reducer will handle that.
				dispatchCount({
					type = "increment",
				})
			end,
		}),
	})
end

-- We'll return both solutions rather than just one like with prior components.
return {
	StateCounter,
	ReducerCounter,
}
