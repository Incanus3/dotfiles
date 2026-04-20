---
description: Cover by characterization tests
argument-hint: [what]
---

Make sure this code has very good test coverage, so that I can confidently refactore it.
Add missing test coverage where needed. The added tests should be "characterization-like" in the
sense that they should lock in the current behavior and have good line/branch coverage, but they
should be structured as standard long-living tests, not as temporary tests created just for the
refactoring, to be dropped afterwards. This also means their name shouldn't contain the
"characterization" term (unless this is part of the tested code's name), since the fact that the
test is a characterization test is temporal and not relevant long-term.

If this code is on the backend, don't consider frontend tests as coverage.
