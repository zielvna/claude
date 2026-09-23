---
name: react-practices
description: React coding practices and conventions to follow when writing or changing React code. Use whenever creating or editing React components, hooks, JSX/TSX, context, or doing frontend component work in general.
---

# React Practices

Practices to follow when doing React work in this project.

## Conditional class names

If the project already uses a class-name utility (e.g. `classnames`/`cx`,
`clsx`), prefer it over template literals and ternaries for conditional
or composed class names, matching how the project imports and uses it.
