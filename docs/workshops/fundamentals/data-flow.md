---
sidebar_position: 6
---

# Props and Data Flow

- _Duration_: 15 minutes
- _Objective_: Learn how data flows between components.
- _Lesson_: [Data Flow]

Understanding how data flows through a React application is key to building
cohesive and maintainable interfaces. This lesson focuses on the concept of
props, their role in the component hierarchy, and the pattern of "lifting state
up" for shared state management.

## Understanding Props

Props, short for properties, are the primary means of passing data from parent
to child components in React. They are read-only, ensuring a unidirectional data
flow that makes your app's data structure easier to understand and debug.

### Characteristics of Props

- **Read-Only**: Props cannot be modified by the component that receives them.
- **Data Passing**: They are used to pass data down the component tree.
- **Custom Components**: Props can be used to customize the rendering and
  behavior of your custom components.

## Component Hierarchy and Data Flow

In React, the component hierarchy plays a crucial role in how data is structured
and flows across the application.

- **Parent-Child Relationship**: Data is passed down from parent to child
  components via props.
- **Unidirectional Flow**: This top-down approach ensures that state is managed
  predictably.

See example 1 in the [data flow] lesson for a more detailed example.

### Lifting State Up

Sometimes, several components need to reflect the same changing data. This is
where the concept of "lifting state up" comes into play.

- **Shared State**: When multiple components need access to the same state, you
  lift this state up to their closest common ancestor.
- **State Management**: The common ancestor manages the state and passes it down
  to the children via props.

See example 2 in the [data flow] lesson for a more detailed example.

## Exercise: Creating a List Component

To apply your understanding of props and data flow, you'll create a list
component that displays an array of strings.

- **Objective**: Learn how data flows between components.
- **Task**: Create a list component that displays a list of strings.

This exercise will help you understand how data flows between components and
how to use props to customize the rendering of your components.

This exercise is provided in exercise 1 in the [data flow] lesson.

[data flow]: https://github.com/LastTalon/react-roblox-workshop/blob/main/lessons/dataFlow/README.md
