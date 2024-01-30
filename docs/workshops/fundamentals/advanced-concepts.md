---
sidebar_position: 7
---

# Advanced Concepts Overview

- _Duration_: 10 minutes
- _Objective_: Touch upon more advanced React concepts.

As you become more comfortable with the basics of React, you'll discover that it
has much more to offer. This section provides a brief overview of some advanced
concepts in React. While we won't go into detailed usage here, it's valuable to
be aware of these features for future learning and development.

### Context API

The Context API is a powerful feature in React for passing data deeply through
the component tree without manually passing props at every level.

- **Use Case**: Ideal for sharing data like themes, user preferences, or
  authentication status across many components.
- **Advantage**: Simplifies component structures by avoiding prop drilling.

```lua
-- Using context in a component.
local function ThemedButton()
  local theme = React.useContext(ThemeContext)
  return Roact.createElement("TextButton", {
    Text = "Click me",
    TextColor3 = theme.TextColor3,
    BackgroundColor3 = theme.BackgroundColor3,
  })
end
```

### Higher Order Components (HOCs)

Higher Order Components (HOCs) are a pattern where a function takes a component
and returns a new component, usually adding additional data or functionality.

- **Purpose**: Enhance components with additional props or data-fetching logic.
- **Example**: A HOC that adds user data to a component might be used to create
  a user-aware version of a basic component.

```lua
-- A HOC that adds user data to a component.
local function withUser(Component)
  local function WithUser(props)
    local user = useUser()
    return Roact.createElement(Component, {
      User = user,
      -- Fill other props
    })
  end
  return WithUser
end
```

### Render Props

Render props refer to a technique where a component expresses its logic by
accepting a function as its child, with the function returning what should be
rendered.

- **Flexibility**: This pattern provides a dynamic way to share code between
  components, offering greater flexibility in how components use the data they
  provide to each other.
- **Used in React**: The `children` prop is a common example of this pattern in
  React.

```lua
-- A component that uses render props.
local function User(props)
  local user = useUser()
  return props.render(user)
end
```

### Advanced Hooks

Beyond `useState` and `useEffect`, React provides additional hooks that offer
more nuanced state and lifecycle management. We've already seen a few of these
in this section.

- **useRef**: Access DOM elements or store a mutable value that does not cause
  re-render on update.
- **useMemo**: Optimize performance by memoizing expensive function results.
- **useCallback**: Memoize callbacks to prevent unnecessary renders in
  components receiving them as props.

Additionally, React provides a way to create custom hooks that encapsulate
common logic for reuse across components. This is a powerful way to share
functionality between components without the need for HOCs or render props.

### Wrapping Up

These advanced concepts in React open up a vast array of possibilities for
optimizing and enhancing your applications. While they require a deeper
understanding of React, they are invaluable tools in a React developer's
toolkit, especially as you start building more complex applications.

We won't be covering these concepts in detail in this workshop, but future
workshops will explore them in more depth.
