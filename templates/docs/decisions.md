# Key Decisions

This is an index of major architectural and technical decisions. Full context for each decision is in the referenced git commit.

## Format
Each decision includes:
- **Date** - When the decision was made
- **Title** - Brief description
- **Commit** - Link to commit with full context (decision, rationale, consequences)
- **Status** - Active, Superseded, or Deprecated

## Decisions

### 2024-11-13: [Decision Title]
- **Commit:** [abc1234](commit/abc1234)
- **Status:** Active
- **Summary:** Brief one-line summary of what was decided

### [Date]: [Decision Title]
- **Commit:** [commit-hash](commit/hash)
- **Status:** [Active/Superseded/Deprecated]
- **Summary:** [one-line summary]

---

## How to Add a Decision

When making a significant decision:

1. **Capture it in your commit message:**
   ```
   feat: implement new feature

   Decision: [What was decided]

   Context: [Why we made this decision]
   - Point 1
   - Point 2

   Consequences:
   - Trade-off 1
   - Trade-off 2
   ```

2. **Add an entry to this file:**
   - Use the commit date
   - Link to the commit
   - Keep the summary brief

3. **Update related docs** if the decision changes:
   - architecture.md
   - constraints.md
   - requirements.md

## What Warrants a Decision Entry?

Add decisions that:
- Change system architecture
- Choose between technical alternatives
- Affect multiple components
- Have long-term impact
- Future developers will wonder "why did we do it this way?"

Don't add:
- Minor implementation details
- Standard practices
- Obvious choices
- Temporary workarounds
