---
sidebar_position: 4
---

# Building Components

- _Duration_: 20 minutes
- _Objective_: Learn to create and compose React components.
- _Lesson_: [Basic Components]

This is a crucial part of your React learning journey – understanding and
building components. In React, components are the heart of your application, and
mastering them is key to successful React development. This section will
introduce you to different types of components and how they work together to
create a dynamic user interface.

## Component Rules

Components are the building blocks of any React application. They are reusable
UI elements that can be independently managed and rendered. Components can be as
simple as a button or as complex as an entire application page.

However, along with the power of components comes the responsibility of using
them correctly. Here are some rules to keep in mind when building components:

- **Pure Render Function**: Components should be pure functions that return
  React elements. This means:
  - **No Side Effects**: Components should not have side effects (e.g.,
    modifying external variables).
  - **No State**: Components should not hold state.
  - **Repeatable**: Components should always return the same output for the same
    input. This means no random numbers or other non-deterministic behavior.
- **Composition**: Components should be composable, meaning they can be nested
  within one another to build complex UI. This means:
  - **Single Responsibility**: Components should be small and focused on a single
    task. This makes them easier to understand and reuse.
  - **Reusability**: Components should be reusable across different parts of your
    application. This means they should be generic and configurable.

## Understanding Functional and Class Components

React components come in two primary flavors: functional and class components.
Both types have their unique features and use cases.

### Functional Components

- **Simplicity**: They are simply functions that return React elements.
- **Easy to Use**: They're easy to write and understand, and they're easy to use
  in other components.
- **Example**:

```lua
local function Greeting(props)
  return React.createElement("TextLabel", { Text = "Hello, " .. props.name })
end
```

Functional components are the most common type of component in React in the
modern day and are the recommended way to write components. They are capable of
doing just about everything class components can do, and they are much easier to
write and understand.

See example 1 in the [Basic Components] lesson for a more detailed example.

### Class Components

- **Stateful**: They can hold and manage internal state.
- **Lifecycle Methods**: Offer stateful control over the component's lifecycle
  (e.g., `componentDidMount`).
- **Example**:

```lua
local Greeting = React.Component:extend("Greeting")

function Greeting:render()
    return React.createElement("TextLabel", { Text = "Hello, " .. self.props.name })
end
```

Class components are the original type of component in React and are still used
in legacy codebases. They are more verbose and harder to understand than their
functional counterparts, but they are still useful in certain situations. They
are not recommended for new codebases, but are important to understand and be
aware of.

See example 2 in the [Basic Components] lesson for a more detailed example.

## Composing Components

One of React's strengths is the ability to compose components, nesting them
within one another to build complex UI.

- **Parent-Child Relationship**: Smaller components can be nested within larger
  ones.
- **Reusability**: Create components that can be reused across different parts
  of your application.

See example 3 in the [Basic Components] lesson for a more detailed example.

## Introduction to Props

Props (short for properties) are how you pass data from a parent component to a
child component. They are read-only, meaning a child component cannot modify the
props it receives (remember the pure render function rule).

- **Passing Data**: Send data down the component tree.
- **Dynamic Content**: Render components dynamically based on the props they
  receive.

### Why pure?

You may be wondering why props are read-only. Why can't a child component modify
the props it receives? The answer is that it makes your components pure. Why is
that important? Because:

- **Predictable**: Pure components are predictable and easy to reason about.
- **Efficient**: Pure components can be optimized for performance.
- **Reusability**: Pure components are reusable and can be used in different
  parts of your application.
- **Rendering**: Props are leveraged by React's rendering engine to efficiently
  update the UI. If a component's props change, React will re-render it. If not,
  React will skip the re-render since it knows the output _must_ be the same.

See example 4 in the [Basic Components] lesson for a more detailed example.

## Getting Started with Hooks: `useState` and `useEffect`

Hooks are a relatively new addition to React that allow you to use state and
other React features in functional components. They are the main reason we can
fearlessly use functional components in React today.

- **useState**: Manage state in a functional component.
  - Use it for variables that change over time.
  - This is how you get the benefits of state in pure functional components.
    - You aren't breaking the pure render function rule because you're not
      modifying external variables. The state is internal to the component.
    - The hook is just a function call, so it's not a side effect. It takes care
      of the managing the state for you.
- **useEffect**: Perform side effects in your component.
  - Ideal for operations like fetching data, subscriptions, or manually changing
    the DOM.
  - This is how you get the benefits of lifecycle methods in pure functional
    components.
    - You aren't breaking the pure render function rule because you're not
      modifying external variables.
    - The hook is just a function call, so it's not a side effect. React's
      lifecycle takes care of the side effects for you.

See example 5 in the [Basic Components] lesson for a more detailed example.

## Exercise: Create a Basic Button Component

Now it's time to put your learning into practice. Your task is to create a basic
button component using React.

- **Objective**: Familiarize yourself with functional components.
- **Task**: Build a button that can be clicked.

This exercise will help you understand how components are created, and how they
react to user inputs.

This exercise is provided in exercise 1 in the [Basic Components] lesson.

[basic components]: https://github.com/LastTalon/react-roblox-workshop/blob/main/lessons/basicComponents/README.md
