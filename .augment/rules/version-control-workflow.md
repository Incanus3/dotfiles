# Version control workflow

Prefer **Jujutsu** (`jj`) over `git` when the `jj` CLI is available. Check with `command -v jj` if unsure. Use the
jujutsu skill for command reference.

When committing changes and `jj` is available, prefer `jj commit` over `jj describe` followed by `jj new`.

When advancing the current bookmark to the latest local commit, prefer `jj bookmark advance` over manually setting the
bookmark target.

Note that `jj bookmark advance` targets `@` by default, which is often the empty working-copy commit immediately after
`jj commit`; in that situation, the desired target is typically `@-`. This can be fixed in Jujutsu config by setting:

```toml
[revsets]
bookmark-advance-to = "closest_pushable(@)"

[revset-aliases]
'closest_pushable(to)' = 'heads(::to & mutable() & ~description(exact:"") & (~empty() | merges()))'
```

## GitLab merge requests in this workspace

For GitLab MR creation from this workspace, see `docs/gitlab-merge-request-workflow.md`.

Some `glab mr` commands can fail because the workspace may not expose a normal `.git` checkout. Prefer `jj` for repo
state and `glab api --hostname qmachine.link` as the reliable fallback for MR creation.

Do not enable auto-merge unless the user explicitly asks for it.
