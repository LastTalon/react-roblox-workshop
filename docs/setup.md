---
sidebar_position: 2
---

# Setup

No installation is required to view or follow along with these workshops. Simply
continue on the docs pages you're currently viewing.

In order to work with the lessons interactively, you'll need to install the
project. This can be done by cloning this repository or your team's fork of it.
Then, follow the instructions below.

## Tooling

These workshops use a variety of tools to make development easier. You can
install many of them using [Aftman] with the following command in the root of
the project:

```shell
aftman install
```

This will provide you with the tools necessary for building below.

[aftman]: https://github.com/LPGhatguy/aftman

## Building

Before building, you'll need to install all dependencies using [Wally].

Navigate to the root of the project and run:

```shell
wally install
```

You can then sync or build the project with [Rojo]. The `default.project.json`
is the main build.

```shell title="Sync"
rojo serve
```

```shell title="Build"
rojo build -o build.rbxl
```

[wally]: https://wally.run/
[rojo]: https://rojo.space/

## Stories

Stories are a great way to develop components in isolation and these workshops
use them extensively. To view the stories, sync or open the built project in
Roblox Studio and use the [Hoarcekat] plugin to open the stories.

[hoarcekat]: https://github.com/Kampfkarren/hoarcekat
