---
name: nest-practices
description: NestJS coding practices and conventions to follow when writing or changing NestJS code. Use whenever creating or editing modules, controllers, providers, DTOs, guards, interceptors, or doing backend work in general.
---

# Nest Practices

Practices to follow when doing NestJS work in this project.

## Follow the project first

These are defaults, not rules. Where the project already has an established
pattern — one that recurs, not a single occurrence — use it. Apply a practice
below only when the project has no clear answer.

Look properly before concluding there is none — read the surrounding files
and search the wider codebase for how the same case is handled elsewhere.

## Fail when nothing was affected

A write that matches no rows is an error, not a no-op. Throw instead of
reporting success for a state change that never happened.

```ts
const deletedItems = await db.delete(items).where(eq(items.id, id)).returning();
if (deletedItems.length === 0) {
  throw new NotFoundException("Item not found");
}
```
