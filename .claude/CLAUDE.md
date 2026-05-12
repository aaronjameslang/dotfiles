# User Preferences

Always use British English

## Command Preferences

- When making files executable, always use `chmod u+x` instead of `chmod +x`

### Git

- When creating a long message, such as for a commit or pr, place the message
  in a temporary file and use the file in the command
- When creating temporary files, always use `mktemp` to
  generate a unique filename in the working directory
  - This avoids collisions between concurrent Claude instances
  - Just run `mktemp` directly — do not assign its output
    to a shell variable. Read the path from the tool output.
  - Example workflow for commits:
    1. Run `mktemp ./tmp.claude.commit.XXXXXX` and read
       the path from the output
    2. Write the message using the Write tool to that path
    3. Commit: `git commit -F '...'`
  - Example workflow for PRs:
    1. Run `mktemp ./tmp.claude.pr.XXXXXX` and read
       the path from the output
    2. Write the body using the Write tool to that path
    3. Create PR: `gh pr create --title "..." --body-file "..."`

- When using git, do not use the -C flag, you are already in the right working directory

- When mentioning a PR, link to the PR

## Code Style Guidelines

- Use pointless functional programming style
- Favour declarative over imperative code
- Factor out embedded functions
- Prefer `function` keyword to arrow functions for named
  functions

### Comments

- Comments should explain WHY something is done, not WHAT
- Do not describe what can be understood by reading the code
- Do not remove exisitng code comments without good reason

### Type Safety

- Avoid type assertions (`as` keyword) where possible
- Prefer proper type guards, validation, or interface
  improvements

### Logging

`console.error` and `console.warn` are acceptable logging
methods.

### Shell Commands

- Do not use `cat` to pipe files into commands that can read
  files directly
- Many commands accept file paths as arguments

## Linear

When I mention a ticket ID (e.g., "SQA-64", "ADM-12", "TTT-135"), this can usual be found in linear.

When accessing a Linear ticket, always read all comments on
the issue as well — they often contain important context,
decisions, and discussion.

When opening a PR, if you have a linear ticket, update the ticket to reference the PR,
and reference the ticket in the PR

### Issue Creation

When creating Linear issues, always set the following fields — if
any cannot be determined from context, ask before creating:

- **Status**: always `todo` (never leave as the default `to prep`)
- **Project**: infer from current codebase context; ask if unclear
- **Assignee**: infer from current user or conversation context; ask if unclear
- **Cycle**: set to the active cycle if one exists; ask if unclear
- **Labels**: always apply repository-specific labels where applicable:
  - `Needs Human Review` - for tickets you create

- Include relevant code references, file paths, or error messages if you have them
- Include implementation suggestion if you have one
