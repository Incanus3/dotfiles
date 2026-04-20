Go through the changes in this branch and review them thoroughly. Use the relevant skills for this.
What you should look for:

- (potential) bugs and inconsistencies
- unfinished stuff
  - missing pieces of functionality that should've been part of the feature
  - unhandled (edge) cases
  - missing test coverage
  - TODO and FIXME comments
- security issues
- optimization opportunities - things that could have done more efficiently without increasing the
  complexity or decreasing readability and maintainability beyond what's reasonable
- simplification opportunities - things that could be done more simply without losing any of the
  functionality, correctness or efficiency

Before you start, have a look at the docs created in this branch (`jj diff -f master --name-only |
grep ^docs`) to have all the relevant context.

If the branch is sizable, use subagents intelligently to avoid runing out of context room. This is
very important - if you hit compaction during the review, you will lose important context and
propose the wrong fixes, show incorrect reasons for bugs, etc.
