local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local React = require(Packages.React)

local e = React.createElement
local useState = React.useState

type UserProfileProps = {
	username: string,
	email: string,
}

-- This is the same as the UserProfile component from the previous example
local function UserProfile(props: UserProfileProps): React.ReactNode
	return e("Frame", {
		Size = UDim2.fromScale(0.5, 1),
		Position = UDim2.fromScale(0, 0),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	}, {
		UserName = e("TextLabel", {
			Text = "Username: " .. props.username,

			Size = UDim2.fromScale(1, 0.5),
			Position = UDim2.fromScale(0, 0),

			BackgroundTransparency = 1,
		}),
		UserEmail = e("TextLabel", {
			Text = "Email: " .. props.email,

			Size = UDim2.fromScale(1, 0.5),
			Position = UDim2.fromScale(0, 0.5),

			BackgroundTransparency = 1,
		}),
	})
end

--[=[
	These are the props of the EditableField component.

	.value string -- The value of the input field
	.onChange (value: string) -> () -- Function to handle text change
	.onSave () -> () -- Function to handle save

	@interface EditableFieldProps
	@within DataFlow
]=]
type EditableFieldProps = {
	value: string,
	onChange: (value: string) -> (),
	onSave: () -> (),
}

--[=[
	This is an editable field component. It's a generic component that can be used
	to edit any field. It is also a "dumb" component because it doesn't have any
	logic of its own. It simply displays the data it's given and provides
	callbacks.

	:::note
	Note that this component doesn't have any state. It's simply passed the value
	and callbacks from the container component. This is what makes it "lifted" or
	"controlled" and a "dumb" component.
	:::

	@within DataFlow
]=]
local function EditableField(props: EditableFieldProps): React.ReactNode
	-- In this component we're only concerned with displaying the input field, and
	-- updating the value when the user types or saves. Note that we're not
	-- storing state here, we're just passing the value and callbacks down from
	-- the container component.
	return e("Frame", {
		Size = UDim2.fromScale(0.5, 0.7),
		Position = UDim2.fromScale(0.5, 0),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	}, {
		InputField = e("TextBox", {
			Text = props.value,

			[React.Change.Text] = function(instance: TextBox)
				props.onChange(instance.Text) -- Function to handle text change
			end,

			Size = UDim2.fromScale(0.7, 0.25),
			Position = UDim2.fromScale(0.5, 0.25),
			AnchorPoint = Vector2.new(0.5, 0.5),

			BackgroundColor3 = Color3.fromRGB(255, 255, 255),
		}),
		SaveButton = e("TextButton", {
			Text = "Save",
			[React.Event.Activated] = props.onSave, -- Function to handle save

			Size = UDim2.fromScale(0.7, 0.25),
			Position = UDim2.fromScale(0.5, 0.75),
			AnchorPoint = Vector2.new(0.5, 0.5),
		}),
	})
end

--[=[
	This is the container component for the user profile again. This time it also
	includes an editable field component. The editable field component is used to
	edit the user's username. It's passed the username from the container
	component, and the container component is passed a callback to update the
	username when the user saves.

	This is what's referred to as "lifting state up". The state is lifted up to
	the container component, and the container component passes the state down to
	the child components. The child components then pass the state back up to the
	container component via callbacks.

	:::note
	Consider what would happen if the EditableField component stored the state for
	the username. The EditableField component would have to pass the username back
	up to the container component via a callback. The container component would
	then have to pass the username back down to the UserProfile component. This
	would be a lot of extra work, and it would be easy to make a mistake. This is
	why it's better to lift the state up to the container component.
	:::

	@within DataFlow
]=]
local function EditableUserProfileContainer(): React.ReactNode
	-- In this component we're storing the state for the username, and passing
	-- that state down to the child components. We're also passing down the
	-- callbacks to update the state, and save the username to the server.
	local username, setUsername = useState("ReactRobloxUser")

	return e("Frame", {
		Size = UDim2.fromScale(1, 1),
		Position = UDim2.fromScale(0, 0),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	}, {
		UserProfile = e(UserProfile, {
			-- Here we can pass our state back down to the child component
			username = username,
			email = "user@example.com",
		}),
		LogoutButton = e("TextButton", {
			Text = "Logout",

			Size = UDim2.fromScale(0.4, 0.1),
			Position = UDim2.fromScale(0.75, 0.8),
			AnchorPoint = Vector2.new(0.5, 0.5),

			-- Logout functionality, etc.
		}),
		EditableUserName = e(EditableField, {
			-- Again, we pass the state down to the child component. Now all of these
			-- components share the same state.
			value = username,

			onChange = function(newUserName: string)
				-- Update the username in our state
				setUsername(newUserName)
			end,

			onSave = function()
				print("Saving username: ", username)
				-- Also save the username to the server somehow
			end,
		}),
		-- Additional user profile components
	})
end

return EditableUserProfileContainer
