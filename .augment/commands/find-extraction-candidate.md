---
description: find the best cohesive extraction candidate
argument-hint: [what]
---
I want to refactor this code by extracting one cohesive responsibility into a smaller collaborator.

Please inspect the target code and enough surrounding context to make a safe recommendation:
- nearby interfaces/abstract classes
- subclasses/overrides
- direct callers if relevant
- existing tests
- existing local abstractions/utilities

Do not implement anything yet. Your job is to identify the best extraction candidate.
The goal is not "find the ugliest code and hide it somewhere else."
The goal is to find a cohesive area or responsibility that:
1. is orthogonal to the target's main responsibility,
2. is currently owned by the target mostly by accident/convenience,
3. has a clear domain/policy boundary,
4. can be named meaningfully,
5. can be tested independently,
6. can be extracted without making dependencies more convoluted.

Pay special attention to dependency direction:
- Prefer extractions where the current code delegates a specific responsibility to the extracted code.
- In special cases, it is also acceptable for the extracted code to wrap the current code.
- Avoid designs where the current and extracted code call back and forth or share mutable state.
- Avoid extraction candidates that would require broad constructor/API churn, heavy subclass changes, or cyclic dependencies.

Please analyze candidates using these criteria:
- Cohesion: does the extracted code own one complete responsibility?
- Orthogonality: is this responsibility separate from the target's primary job?
- Dependency shape: are dependencies narrow and unidirectional?
- Testability: can the extracted behavior be covered with focused tests?
- Subclass/caller impact: can existing extension points remain stable?
- Risk: is behavior preservation straightforward?
- Value: does this meaningfully simplify the target?

Return:
1. A short summary of the target's apparent main responsibility.
2. 2–4 possible extraction candidates.
3. For each candidate:
    - proposed name
    - responsibility it would own
    - what inputs/dependencies it would need
    - how the current code would delegate to it
    - why it is or is not a good fit
    - expected test strategy
    - risk level
4. Your recommended first extraction.
5. Why this is the best first step.
6. What you would explicitly not extract yet, and why.
7. Stop after the recommendation. Do not modify code until I explicitly ask.
