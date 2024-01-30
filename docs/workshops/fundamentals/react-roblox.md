---
sidebar_position: 8
---

# React in the Roblox Context

- _Duration_: 10 minutes
- _Objective_: Connect React fundamentals to the Roblox environment.

After exploring the fundamentals of React, it's time to understand how these
concepts apply in the unique environment of Roblox. React's adaptability is one
of its greatest strengths, allowing it to be used in diverse contexts, including
the world of Roblox game development.

## Overview of react-roblox

`react-roblox` is a custom renderer for React, enabling the use of React's
declarative UI paradigm to create Roblox game interfaces. It bridges the gap
between React and the Roblox UI framework, allowing developers to apply familiar
React patterns within Roblox.

## React Fundamentals in Roblox

Much of what you've learned about React applies the same to using React in
Roblox or in a web development context.

### Differences and Similarities

Much remains the same:

- **Components**: Whether in web or Roblox development, you build UIs using
  components.
- **State and Props**: These concepts remain consistent; state management and
  data flow via props work the same way.
- **Hooks**: Hooks like `useState` and `useEffect` are used for managing state
  and side effects.

While `react-roblox` allows you to use React within Roblox, there are key points
to keep in mind:

- **Custom Renderer**: `react-roblox` serves as a bridge between React and
  Roblox's UI system. This means some adjustments to how components render and
  behave.
- **Roblox UI Elements**: You'll be dealing with Roblox-specific UI elements,
  but the way you manage them with React remains largely the same.
- **Roblox Events**: Roblox UI elements use Roblox events instead of the web's
  system of events and callbacks.
