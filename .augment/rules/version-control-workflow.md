# Version control workflow

Prefer **Jujutsu** (`jj`) over `git` when the `jj` CLI is available. Check with `command -v jj` if
unsure. Use the jujutsu skill for command reference.

If any `jj` command fails with **"the working copy is stale"**, stop immediately. Do not retry the
command, refresh the working copy, or attempt any workaround. Report the condition to the user and
wait for them to resolve it.

When committing changes and `jj` is available, prefer `jj commit` over `jj describe` followed by `jj new`.

Wrap all commit message lines to a maximum of 100 characters.

When doing `jj squash`, don't use the `-m` (`--message`) param unless there is a good reason to.
Just running `jj squash` is enough to squash the current changes into the last commit (`@-`) while
keeping its message.

When advancing the current bookmark to the latest local commit, prefer `jj bookmark advance` over
manually setting the bookmark target.

Note that `jj bookmark advance` targets `@` by default, which is often the empty working-copy commit
immediately after `jj commit`; in that situation, the desired target is typically `@-`. This can be
fixed in Jujutsu config by setting:

```toml
[revsets]
bookmark-advance-to = "closest_pushable(@)"

[revset-aliases]
'closest_pushable(to)' = 'heads(::to & mutable() & ~description(exact:"") & (~empty() | merges()))'
```

## GitLab merge requests in this workspace

For GitLab MR creation from this workspace, see `docs/gitlab-merge-request-workflow.md`.

Some `glab mr` commands can fail because the workspace may not expose a normal `.git` checkout.
Prefer `jj` for repo state and `glab api --hostname qmachine.link` as the reliable fallback for MR
creation.

Do not enable auto-merge unless the user explicitly asks for it.
