# User Preferences

Always use British English

## Command Preferences

- When making files executable, always use `chmod u+x` instead of `chmod +x`

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

When I mention a ticket ID (e.g., "SQA-64", "ADM-12", "TTT-135"), this can usually be found in linear.
