---
name: git
description: Use when working with git or pull requests
---

# Git commit and PR message workflow

When writing a commit message or PR body, always place the message in a temporary file and pass that file to the git/gh command. Do not pass long messages inline via `-m` or HEREDOCs — they hit shell-escaping issues and conflict with concurrent Claude instances.

## Temporary files

Use `mktemp` to generate a unique filename in the working directory. This avoids collisions between concurrent Claude instances.

- Run `mktemp` directly — do not assign its output to a shell variable. Read the path from the tool output.
- Use a `./tmp.claude.*.XXXXXX` template so the file is easy to identify.

## Commit workflow

1. Run `mktemp ./tmp.claude.commit.XXXXXX` and read the path from the output.
2. Write the message using the Write tool to that path.
3. Commit: `git commit -F <path>`.

## PR workflow

1. Run `mktemp ./tmp.claude.pr.XXXXXX` and read the path from the output.
2. Write the body using the Write tool to that path.
3. Create PR: `gh pr create --title "..." --body-file <path>`.

## Checking PR status

- Use `gh pr status` to see PRs relevant to you (current branch, created by you, requesting your review).
- Pass `--conflict-status` to include merge-conflict information: `gh pr status --conflict-status`.
- Use `gh pr checks [<number-or-branch>]` to see CI check results for a PR. Defaults to the current branch's PR if no argument is given.

## Keeping origin/main up to date

Before comparing branches, checking if a PR is behind, or diffing against main, fetch first so your local view of `origin/main` is current:

- `git fetch origin main` updates the remote-tracking ref without touching your working tree.
- Use `origin/main` (not local `main`) as the comparison base — it reflects what's actually on the remote.

## Other git conventions

- Do not use the `-C` flag — you are already in the right working directory.
- When mentioning a PR in any output, link to it.
