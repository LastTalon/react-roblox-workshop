local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Packages = ReplicatedStorage.Packages
local React = require(Packages.React)

local e = React.createElement

--[=[
	@class DataFlow
]=]

--[=[
	These are the props of the UserProfile component.

	.username string -- The user's username
	.email string -- The user's email address

	@interface UserProfileProps
	@within DataFlow
]=]
type UserProfileProps = {
	username: string,
	email: string,
}

--[=[
	This component displays the user's profile data. It's what's often referred to
	as a "dumb" component because it doesn't have any logic of its own. It simply
	displays the data it's given. In this case, it's given the user's username and
	email address and it displays them.

	@within DataFlow
]=]
local function UserProfile(props: UserProfileProps): React.ReactNode
	-- In this component we're only concerned with displaying the user profile
	-- data

	-- We create a frame to hold everything.
	return e("Frame", {
		Size = UDim2.fromScale(0.5, 1),
		Position = UDim2.fromScale(0, 0),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	}, {
		-- We create two text labels to display the user's username and email. We
		-- position and size them so they fit nicely in the frame.
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
	This component is a container for the user profile. It's what's often referred
	to as a "smart" component because it has logic of its own and helps keep track
	of (and compartmentalize) how things work. In this case, it contains the user
	profile data and additional information and controls that go along with it. It
	also passes the user profile data down to the UserProfile component.

	For the sake of simplicity, we're not actually getting the user profile data
	from anywhere. We're just hard-coding it in this component. In a real
	application, we'd probably get the user profile data from a server or some
	other source. And for the sake of brevity, we're not actually performing any
	of the logic or functionality that would go along with the additional user
	profile information and controls. We're just displaying a logout button.

	@within DataFlow
]=]
local function UserProfileContainer(): React.ReactNode
	local userData = {
		username = "ReactRobloxUser",
		email = "user@example.com",
	}

	-- In this component we're concerned with the user profile data and the
	-- additional information and controls that go along with it. We'd like to
	-- simplify the displaying of the actual user profile data by passing it down
	-- to a child component. Right now this UserProfile component is only used in
	-- this file, but we could easily move it to a separate file and import it if
	-- we wanted to re-use it. This is a common composition pattern.
	return e("Frame", {
		Size = UDim2.fromScale(1, 1),
		Position = UDim2.fromScale(0, 0),
		BackgroundColor3 = Color3.fromRGB(255, 255, 255),
	}, {
		UserProfile = e(UserProfile, userData),
		LogoutButton = e("TextButton", {
			Text = "Logout",

			Size = UDim2.fromScale(0.4, 0.1),
			Position = UDim2.fromScale(0.75, 0.8),
			AnchorPoint = Vector2.new(0.5, 0.5),

			-- Logout functionality, etc.
		}),
		-- Additional user profile components
	})
end

return UserProfileContainer
