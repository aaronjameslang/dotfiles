---
name: linear-ticket
description: Use when reading, referencing, or creating Linear tickets. Covers required fields for new issues, mandatory comment-reading when accessing tickets, and the PR ↔ ticket cross-linking convention. Triggers when the user mentions a ticket ID (e.g. SQA-64, ADM-12, TTT-135), asks to open/read/update a Linear issue, or opens a PR that relates to a ticket.
---

# Linear ticket workflow

## Reading a ticket

When accessing a Linear ticket, always read all comments on the issue as well — they often contain important context, decisions, and discussion that are not in the issue body.

## Creating an issue

Always set the following fields. If any cannot be determined from context, ask before creating:

- **Status**: always `todo` (never leave as the default `to prep`).
- **Project**: infer from current codebase context; ask if unclear.
- **Assignee**: infer from current user or conversation context; ask if unclear.
- **Cycle**: set to the active cycle if one exists; ask if unclear.
- **Labels**: apply repository-specific labels where applicable. Always add `Needs Human Review` to tickets you create.

Include in the body:

- Relevant code references, file paths, or error messages if available.
- An implementation suggestion if you have one.

## PR ↔ ticket cross-linking

When opening a PR that relates to a Linear ticket:

- Update the ticket to reference the PR.
- Reference the ticket in the PR.
