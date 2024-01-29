local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local React = require(Packages.React)

local e = React.createElement
local useEffect = React.useEffect
local useReducer = React.useReducer

--[=[
	If we have a lot of state variables, it can be a bit cumbersome to manage
	them. Or perhaps we want to do something when multiple state variables change.
	Or maybe we change the state in many different places and want to make sure
	we're doing it consistently.

	React provides a hook called `useReducer` that allows us to manage state in a
	more consistent way. It's similar to the `useState` hook, but instead of
	returning a state variable and a setter function, it returns a state variable
	and a dispatch function.

	If you're familiar with Redux, this concept should be familiar to you. The
	dispatch function dispatches an action to a reducer function. The reducer
	function then returns the new state based on the action and the previous
	state.

	The reducer function is a lot like your render function. It should be a pure
	function that only calculates the new state and doesn't cause any side
	effects. Given the same state and action, it should always return the same new
	state. This makes it much easier to reason about and allows us to consolidate
	our state.

	Although our state management is very simple right now, we'll use `useReducer`
	so we can see how it works. We don't really need it for simple state like this
	but it's good to get familiar with it. As an additional challenge, consider
	that internally `useState` actually uses `useReducer` in its implementation.

	@within StateManagement
]=]
local function ReducerDisplay(): React.ReactNode
	useEffect(function()
		print("MessageDisplay was rendered!")
	end, {})

	-- Let's create some  types for our state and actions.
	type State = {
		-- We'll store our message in the state. It's good practice for our state to
		-- be a table so we can add more state variables later.
		message: string,
	}

	type Action = {
		-- It's also good practice for our actions to be tables so we can add more
		-- action types later. Additionally, it's typical to have an `action.type`
		-- field that describes the type of action. Here we only have one `set`
		-- action. But we may want to add more actions later.
		type: "set",

		-- Our `set` action will have a `message` field that describes the new
		-- message. Each action type may have different fields, but since we only
		-- have one action type, our action is simple.
		message: string,
	}

	-- Here we'll replace `useState` with `useReducer`.
	local message, dispatchMessage = useReducer(function(state: State, action: Action): State
		-- We get passed in the previous state and the action and we want to return
		-- the new state.

		-- The first thing we'll do is check the action type. We'll only have one
		-- action type so this is very simple. But if we had more action types, we
		-- could check the action type here and return different state based on the
		-- action type. This is similar to how we would use a `switch` statement in
		-- other languages.
		if action.type == "set" then
			-- If the action type is `set`, we'll return a new state with the new
			-- message.

			-- We must return a new object here. If we returned the same object we
			-- would no longer have a pure function as it would be mutating the
			-- previous state. Remember, React uses this state to determine if it
			-- needs to re-render.
			return {
				message = action.message,
			}
		end

		-- If the action type is not `set`, we'll just return the previous state. We
		-- must always return some state from our reducer function. Here we're
		-- saying that if we don't recognize the action type, our state doesn't
		-- change.
		return state
	end, {
		-- We'll initialize our state to "Hello, world!" just like before.
		message = "Hello, world!",
	})

	useEffect(function()
		return function()
			print("MessageDisplay was destroyed!")
		end
	end, {})

	useEffect(function()
		print("MessageDisplay's message changed to: ", message)
	end, { message })

	return e("Frame", {
		-- Let's make our message display easy to see
		Size = UDim2.fromOffset(200, 100),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
	}, {
		TextInput = React.createElement("TextBox", {
			PlaceholderText = "Enter a message",

			-- Position this one above the center of the frame
			Size = UDim2.fromScale(1, 0.5),
			Position = UDim2.fromScale(0, 0),

			[React.Change.Text] = function(newText: string)
				-- Here we need to instead dispatch an action to our reducer. For more
				-- complex state we can use special functions called "action creators"
				-- to create our actions (consolidating that behavior, just like
				-- `useReducer` does). But for simple state like this, we can simply
				-- create the action inline.
				dispatchMessage({
					-- We want to set the message to the new text so we create a `set`
					-- action.
					type = "set",

					-- We'll pass the new text as the `message` field.
					message = newText,
				})
			end,
		}),
		DisplayLabel = React.createElement("TextLabel", {
			-- Down here we need to remember to pull our message out of the state. For
			-- complex state we can use special functions called "selectors" to pull
			-- out the data we need (also consolidating that behavior, just like
			-- `useReducer` does). But again, for simple state like this, we can just
			-- access it directly.
			Text = message.message,

			-- Position this one below the center of the frame
			Size = UDim2.fromScale(1, 0.5),
			Position = UDim2.fromScale(0, 0.5),
		}),
	})
end

return ReducerDisplay
