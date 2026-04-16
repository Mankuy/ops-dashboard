# PRP Issue Investigation

Analyze a GitHub issue and create an implementation plan.

## Step 1: Fetch the Issue
```bash
gh issue view $ARGUMENTS --repo Mankuy/ops-dashboard --json title,body,labels,comments
```

## Step 2: Generate Codebase Context
```bash
cd /mnt/d/CLAUDE/ops-dashboard
repomix --style markdown --output .claude/PRPs/issues/context-$ARGUMENTS.md .
```

## Step 3: Analyze
1. Read the issue title and body
2. Read the codebase context file
3. Identify which files/sections are relevant
4. Determine if this is a bug fix or feature request
5. Check for related issues or past PRs

## Step 4: Create Investigation Report
Save to `.claude/PRPs/issues/issue-$ARGUMENTS.md`:
```markdown
# Issue #$ARGUMENTS: [TITLE]

## Summary
[What the issue is about in 1-2 sentences]

## Classification
- Type: [bug|feature|enhancement|question]
- Complexity: [simple|medium|complex]
- Estimated effort: [hours]

## Root Cause (for bugs)
[Analysis of likely cause]

## Implementation Plan
1. [Step 1]
2. [Step 2]
...

## Validation
- [ ] Test case 1
- [ ] Test case 2

## Related Files
- `dashboard.html` lines X-Y: [what's there]
```

## Step 5: Suggest Next Action
Based on complexity:
- Simple → Say "I can fix this now, want me to?"
- Medium → Say "Here's the plan, want me to implement it?"
- Complex → Say "This needs more planning, let me create a PRP-plan first"
