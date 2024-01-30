---
sidebar_position: 2
---

# Introduction to React

- _Duration_: 10 minutes
- _Objective_: Understand the basics of React and its significance.

This workshop will introduce you to the core concepts of React, a powerful
library for building user interfaces. React stands out for its efficiency,
flexibility, and the intuitive way it allows developers to design complex UI.

## A Brief History of React

React was created by a team of engineers at Facebook and was released in 2013.
It was developed to address specific challenges in building large-scale
applications with data that changes over time. Today, React is one of the most
popular tools for front-end web development, used by countless websites and
applications.

### Why React?

React brought a revolutionary approach to building web interfaces. Its
component-based architecture allows developers to build encapsulated components
that manage their own state, then compose them to make complex UI. React's use
of a virtual DOM (Document Object Model) ensures efficient updates and rendering
of the UI, making applications fast and responsive.

## Understanding React's Core Principles

At the heart of React are three fundamental concepts:

### Components

Components are the building blocks of any React application. Think of them as
reusable UI elements that can be independently managed and rendered. Components
can be as simple as a button or as complex as an entire application page.

### State

State in React refers to the data or properties that need to be tracked in an
application. State is what allows your components to be dynamic and interactive.
For instance, the input in a text field or the open/close status of a dropdown
menu can be part of a component's state.

### Props

Props (short for "properties") are how you pass data from one component to
another, especially from parent to child components. They are read-only and help
you create components that are reusable and configurable.

## JSX: Bringing Everything Together

JSX (JavaScript XML) is a React extension that allows you to write HTML
structures in the same file as your JavaScript code. This doesn't mean that HTML
is embedded in JavaScript; rather, JSX provides syntactic sugar for React
function calls, which transform HTML-like text into JavaScript objects.

JSX helps make your components' structure more readable and expressive, closely
resembling the actual UI structure and is the recommended way to write React in
the modern day. As a result, you will see JSX used frequently.

However, JSX is not supported in Lua or Luau, so we will not be using it in this
workshop. Instead, we will be using the React API directly. If you use roblox-ts
TSX is supported, but we will not be using that in this workshop in order to be
more accessible to those who are not familiar with TypeScript.

## Wrap-Up

This introduction sets the foundation for what makes React a powerful tool for
UI development. As we progress, you'll see these concepts in action, and by the
end of this series, you'll be equipped to build robust, efficient, and
interactive web applications using React.
