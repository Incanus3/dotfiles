# Task tracking with beads

Use beads as the default task source in this workspace. Use `br`/`bd` commands to interact with issues rather than
editing task files manually. Issues are stored in `.beads/` and tracked in git.

At the start of a conversation, run `br ready` to see what work is available and ask the user what to focus on.
Beads should be the first place you look when the user asks what to work on, asks for a status check, or uses similar
casual phrasing. Interpret casual status-check questions such as "what's up?" or "anything ready?" as a request to
check `br ready` and summarize the ready beads.

## Essential commands

```bash
# View ready issues (unblocked, not deferred)
br ready              # or: bd ready

# List and search
br list --status=open # All open issues
br show <id>          # Full issue details with dependencies
br search "keyword"   # Full-text search

# Create and update
br create --title="..." --description="..." --type=task --priority=2
br update <id> --status=in_progress
br close <id> --reason="Completed"
br close <id1> <id2>  # Close multiple issues at once

# Sync with git
br sync --flush-only  # Export DB to JSONL
br sync --status      # Check sync status
```

## Workflow pattern

1. **Start**: Run `br ready` to find actionable work.
2. **Claim**: Use `br update <id> --status=in_progress`.
3. **Work**: Implement the task.
4. **Complete**: Use `br close <id>`.
5. **Sync**: Run `br sync --flush-only` at session end.

## Key concepts

- **Dependencies**: Issues can block other issues. `br ready` shows only unblocked work.
- **Priority**: P0=critical, P1=high, P2=medium, P3=low, P4=backlog (use numbers 0-4, not words).
- **Types**: task, bug, feature, epic, chore, docs, question.
- **Blocking**: `br dep add <issue> <depends-on>` adds dependencies.

## Best practices

- Update status as you work (`in_progress` → `closed`).
- Create new issues with `br create` when you discover tasks.
- Use descriptive titles and set appropriate priority/type.
