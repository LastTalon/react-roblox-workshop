---
sidebar_position: 5
---

# State Management and Lifecycle

- _Duration_: 20 minutes
- _Objective_: Understand how to manage state and lifecycle in React.
- _Lesson_: [State Management]

In this section, we delve into two fundamental aspects of React components:
managing state and understanding the component lifecycle. Mastering these
concepts is essential for creating dynamic and responsive applications.

## State Management in Functional Components

State in React is used to track changes in a component's data, leading to a
re-render of the component when that data changes. With the introduction of
hooks in React, managing state in functional components has become more
straightforward.

### Using `useState`

- **Purpose**: `useState` is a hook that lets you add React state to functional
  components.
- **How it Works**: When you update state, the component responds by
  re-rendering.
- **Example**:

```lua
-- count is the current state, and setCount is a function to update it.
local count, setCount = React.useState(0)
```

We can use `useState` to create a counter that increments when a button is
clicked. In this example, we can see we get two values from `useState`: the
current state and a function to update it. We provide an initial value of `0`.

See example 1 in the [State Management] lesson for a more detailed example.

### Using `useEffect`

- **Purpose**: `useEffect` is a hook that lets you perform side-effects in
  functional components.
- **How it Works**: `useEffect` runs after every render, and it can be used to
  perform side-effects like fetching data or subscribing to events.
- **Example**:

```lua
-- This effect runs when the count changes.
React.useEffect(function()
  print("Count changed to ", count)
end, { count })
```

We can use `useEffect` to print the current count whenever it changes. In this
example, we can see that we provide a function to run as the first argument, and
a list of dependencies as the second argument. The function will run after every
render, but it will only run again if the dependencies change. If your effect
function closes over any values (like `count` in this example), you should
typically include them in the dependency list.

See example 2 in the [State Management] lesson for a more detailed example.

### Using `useReducer`

- **Purpose**: `useReducer` is a hook that lets you manage state in functional
  components (just like `useState`).
- **How it Works**: `useReducer` is similar to `useState`, but it lets you
  manage state using a reducer function (just like Redux).
- **Example**:

```lua
-- count is the current state, and dispatch is a function to update it.
local count, dispatch = React.useReducer(function(state, action)
  if action.type == "increment" then
    return state + 1
  elseif action.type == "decrement" then
    return state - 1
  else
    return state
  end
end, 0)
```

We can use `useReducer` to create a counter that increments or decrements when
buttons are clicked. In this example, we can see we get two values from
`useReducer`: the current state and a function to update it, just like with
`useState`. The difference is that we provide a reducer function as the first
argument, and an initial value as the second argument. Additionally, the update
function takes an action as its argument, and the reducer function is used to
determine the new state based on the action.

This all sounds very complicated, but it's actually quite simple. We use this
when we want to centralize the logic for updating state rather than having it
spread out across the component. This is prone to errors and inconsistencies.

See example 3 in the [State Management] lesson for a more detailed example.

### Reactivity

- **Reactive Updates**: React automatically updates the UI based on state
  changes, making your UI consistent with your data.

## Lifecycle in Class Components

While functional components use hooks for managing side-effects, class
components rely on lifecycle methods.

### Key Lifecycle Methods

- **componentDidMount**: Called after the component is rendered for the first
  time. Ideal for initial data fetching or subscriptions.
- **componentDidUpdate**: Invoked after any subsequent re-renders. Use it to
  react to prop or state changes.
- **componentWillUnmount**: Called before the component is removed from the DOM.
  Perfect for cleanup activities like removing event listeners.

## Exercise: Implementing a Counter

To solidify your understanding of state management and lifecycle methods, you'll
build a simple counter application.

- **Objective**: Learn how to manage state and lifecycle in React.
- **Task**: Build a counter that increments when a button is clicked.

This exercise will help you understand how to use state to make components.

This exercise is provided in exercise 1 in the [State Management] lesson.

[state management]: https://github.com/LastTalon/react-roblox-workshop/blob/main/lessons/stateManagement/README.md
