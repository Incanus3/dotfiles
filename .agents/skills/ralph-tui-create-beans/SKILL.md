---
name: ralph-tui-create-beans
description: "Convert PRDs to beans for ralph-tui execution. Creates an epic with child beans for each user story. Use when you have a PRD and want to use ralph-tui with beans as the task source. Triggers on: create beans, convert prd to beans, beans for ralph, ralph beans."
---

# Ralph TUI - Create Beans

Converts PRDs to beans (epic + child tasks) for ralph-tui autonomous execution.

> **Note:** This skill uses the [beans](https://github.com/hmans/beans) flat-file issue tracker. Beans are stored as markdown files in `.beans/`.

---

## The Job

Take a PRD (markdown file or text) and create beans:
1. **Extract Quality Gates** from the PRD's "Quality Gates" section
2. Create an **epic** bean for the feature
3. Create **child beans** for each user story (with quality gates appended)
4. Set up **dependencies** between beans using `--blocked-by`
5. Output ready for `ralph-tui run --tracker beans`

---

## Step 1: Extract Quality Gates

Look for the "Quality Gates" section in the PRD:

```markdown
## Quality Gates

These commands must pass for every user story:
- `pnpm typecheck` - Type checking
- `pnpm lint` - Linting

For UI stories, also include:
- Verify in browser using dev-browser skill
```

Extract:
- **Universal gates:** Commands that apply to ALL stories (e.g., `pnpm typecheck`)
- **UI gates:** Commands that apply only to UI stories (e.g., browser verification)

**If no Quality Gates section exists:** Ask the user what commands should pass, or use a sensible default like `npm run typecheck`.

---

## Output Format

Beans use `beans create` command with **HEREDOC syntax** to safely handle special characters in the body:

```bash
# Create epic (reference source PRD in body)
beans create "[Feature Name]" \
  --type epic \
  --status todo \
  --body "$(cat <<'EOF'
[Feature description from PRD]

Source PRD: ./tasks/feature-name-prd.md
EOF
)"

# Create child bean (with quality gates in acceptance criteria)
beans create "[Story Title]" \
  --parent EPIC_ID \
  --status todo \
  --priority [critical|high|normal|low|deferred] \
  --body "$(cat <<'EOF'
[Story description with acceptance criteria INCLUDING quality gates]
EOF
)"
```

> **CRITICAL:** Always use `<<'EOF'` (single-quoted) for the HEREDOC delimiter. This prevents shell interpretation of backticks, `$variables`, and `()` in descriptions.

---

## Story Size: The #1 Rule

**Each story must be completable in ONE ralph-tui iteration (~one agent context window).**

ralph-tui spawns a fresh agent instance per iteration with no memory of previous work. If a story is too big, the agent runs out of context before finishing.

### Right-sized stories:
- Add a database column + migration
- Add a UI component to an existing page
- Update a server action with new logic
- Add a filter dropdown to a list

### Too big (split these):
- "Build the entire dashboard" → Split into: schema, queries, UI components, filters
- "Add authentication" → Split into: schema, middleware, login UI, session handling
- "Refactor the API" → Split into one story per endpoint or pattern

**Rule of thumb:** If you can't describe the change in 2-3 sentences, it's too big.

---

## Story Ordering: Dependencies First

Stories execute in dependency order. Earlier stories must not depend on later ones.

**Correct order:**
1. Schema/database changes (migrations)
2. Server actions / backend logic
3. UI components that use the backend
4. Dashboard/summary views that aggregate data

**Wrong order:**
1. ❌ UI component (depends on schema that doesn't exist yet)
2. ❌ Schema change

---

## Dependencies with `--blocked-by`

Use the `--blocked-by` flag on `beans create` or `beans update` to specify which beans must complete first:

```bash
# Create the beans — first story has no dependencies
beans create "US-001: Add schema" --parent EPIC_ID --status todo ...

# Subsequent stories declare their blockers at creation time
beans create "US-002: Create API" \
  --parent EPIC_ID \
  --status todo \
  --blocked-by BEAN_ID_OF_US001 \
  ...

beans create "US-003: Build UI" \
  --parent EPIC_ID \
  --status todo \
  --blocked-by BEAN_ID_OF_US002 \
  ...
```

**Syntax:** `--blocked-by <id>` — this bean is blocked by (depends on) the specified bean.

You can also add dependencies after creation:
```bash
beans update <id> --blocked-by <blocker-id>
```

ralph-tui will:
- Show blocked beans as "blocked" until dependencies complete
- Never select a bean for execution while its dependencies are open
- Include dependency context in the prompt when working on a bean

**Correct dependency order:**
1. Schema/database changes (no dependencies)
2. Backend logic (blocked by schema)
3. UI components (blocked by backend)
4. Integration/polish (blocked by UI)

---

## Acceptance Criteria: Quality Gates + Story-Specific

Each bean's body should include acceptance criteria with:
1. **Story-specific criteria** from the PRD (what this story accomplishes)
2. **Quality gates** from the PRD's Quality Gates section (appended at the end)

### Good criteria (verifiable):
- "Add `investorType` column to investor table with default 'cold'"
- "Filter dropdown has options: All, Cold, Friend"
- "Clicking toggle shows confirmation dialog"

### Bad criteria (vague):
- ❌ "Works correctly"
- ❌ "User can do X easily"
- ❌ "Good UX"
- ❌ "Handles edge cases"

---

## Conversion Rules

1. **Extract Quality Gates** from PRD first
2. **Each user story → one bean**
3. **First story**: No dependencies (creates foundation)
4. **Subsequent stories**: Use `--blocked-by` to declare blockers (UI blocked by backend, etc.)
5. **Priority**: Based on dependency order, then document order (`critical`, `high`, `normal`, `low`, `deferred`)
6. **All stories**: `--status todo`
7. **Acceptance criteria**: Story criteria + quality gates appended in the body
8. **UI stories**: Also append UI-specific gates (browser verification)

---

## Splitting Large PRDs

If a PRD has big features, split them:

**Original:**
> "Add friends outreach track with different messaging"

**Split into:**
1. US-001: Add investorType field to database
2. US-002: Add type toggle to investor list UI
3. US-003: Create friend-specific phase progression logic
4. US-004: Create friend message templates
5. US-005: Wire up task generation for friends
6. US-006: Add filter by type
7. US-007: Update new investor form
8. US-008: Update dashboard counts

Each is one focused change that can be completed and verified independently.

---

## Example

**Input PRD:**
```markdown
# PRD: Friends Outreach

Add ability to mark investors as "friends" for warm outreach.

## Quality Gates

These commands must pass for every user story:
- `pnpm typecheck` - Type checking
- `pnpm lint` - Linting

For UI stories, also include:
- Verify in browser using dev-browser skill

## User Stories

### US-001: Add investorType field to investor table
**Description:** As a developer, I need to categorize investors as 'cold' or 'friend'.

**Acceptance Criteria:**
- [ ] Add investorType column: 'cold' | 'friend' (default 'cold')
- [ ] Generate and run migration successfully

### US-002: Add type toggle to investor list rows
**Description:** As Ryan, I want to toggle investor type directly from the list.

**Acceptance Criteria:**
- [ ] Each row has Cold | Friend toggle
- [ ] Switching shows confirmation dialog
- [ ] On confirm: updates type in database

### US-003: Filter investors by type
**Description:** As Ryan, I want to filter the list to see just friends or cold.

**Acceptance Criteria:**
- [ ] Filter dropdown: All | Cold | Friend
- [ ] Filter persists in URL params
```

**Output beans:**
```bash
# Create epic (reference source PRD in body)
beans create "Friends Outreach Track" \
  --type epic \
  --status todo \
  --body "$(cat <<'EOF'
Warm outreach for deck feedback.

Source PRD: ./tasks/friends-outreach-prd.md
EOF
)"

# Capture the epic ID from output (e.g., beans-abc123)
# US-001: No deps (first — creates schema)
beans create "US-001: Add investorType field to investor table" \
  --parent EPIC_ID \
  --status todo \
  --priority high \
  --body "$(cat <<'EOF'
As a developer, I need to categorize investors as 'cold' or 'friend'.

## Acceptance Criteria
- [ ] Add investorType column: 'cold' | 'friend' (default 'cold')
- [ ] Generate and run migration successfully
- [ ] pnpm typecheck passes
- [ ] pnpm lint passes
EOF
)"

# US-002: UI story (gets browser verification too), blocked by US-001
beans create "US-002: Add type toggle to investor list rows" \
  --parent EPIC_ID \
  --status todo \
  --priority normal \
  --blocked-by BEAN_ID_OF_US001 \
  --body "$(cat <<'EOF'
As Ryan, I want to toggle investor type directly from the list.

## Acceptance Criteria
- [ ] Each row has Cold | Friend toggle
- [ ] Switching shows confirmation dialog
- [ ] On confirm: updates type in database
- [ ] pnpm typecheck passes
- [ ] pnpm lint passes
- [ ] Verify in browser using dev-browser skill
EOF
)"

# US-003: UI story, blocked by US-002
beans create "US-003: Filter investors by type" \
  --parent EPIC_ID \
  --status todo \
  --priority low \
  --blocked-by BEAN_ID_OF_US002 \
  --body "$(cat <<'EOF'
As Ryan, I want to filter the list to see just friends or cold.

## Acceptance Criteria
- [ ] Filter dropdown: All | Cold | Friend
- [ ] Filter persists in URL params
- [ ] pnpm typecheck passes
- [ ] pnpm lint passes
- [ ] Verify in browser using dev-browser skill
EOF
)"
```

---

## Output Location

Beans are stored as markdown files in: `.beans/`

After creation, run ralph-tui:
```bash
# Work on a specific epic
ralph-tui run --tracker beans --epic EPIC_ID

# Or let it pick the best task automatically
ralph-tui run --tracker beans
```

ralph-tui will:
1. Work on beans within the specified epic (or select the best available task)
2. Close each bean when complete
3. Close the epic when all children are done
4. Output `<promise>COMPLETE</promise>` when epic is done

---

## Checklist Before Creating Beans

- [ ] Extracted Quality Gates from PRD (or asked user if missing)
- [ ] Each story is completable in one iteration (small enough)
- [ ] Stories are ordered by dependency (schema → backend → UI)
- [ ] Quality gates appended to every bean's acceptance criteria (in body)
- [ ] UI stories have browser verification (if specified in Quality Gates)
- [ ] Acceptance criteria are verifiable (not vague)
- [ ] No story depends on a later story (only earlier stories)
- [ ] Dependencies declared with `--blocked-by` on `beans create`
