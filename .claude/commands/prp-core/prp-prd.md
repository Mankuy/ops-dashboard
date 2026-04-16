# PRP PRD Generator

Generate a Product Requirements Document for the Ops Dashboard.

## Your Task
Create a comprehensive PRD for: $ARGUMENTS

## PRD Template

Create the file at `.claude/PRPs/prds/[feature-name].prd.md`:

```markdown
# PRD: [Feature Name]

## Overview
[What this feature does in 2-3 sentences]

## Problem Statement
[Why we need this — what pain point it solves]

## User Stories
- As a [user], I want [action] so that [benefit]
- As a [user], I want [action] so that [benefit]

## Technical Requirements

### Dashboard Impact
- [ ] New tab or section?
- [ ] New canvas elements?
- [ ] New modals/popups?
- [ ] New localStorage keys?
- [ ] New CSS classes?

### Implementation Phases
| Phase | Description | Status | Depends On |
|-------|-------------|--------|------------|
| 1     | [Phase 1]   | pending | -          |
| 2     | [Phase 2]   | pending | Phase 1    |

### Architecture
[How it fits into the existing dashboard structure]

## Success Criteria
- [ ] Criterion 1
- [ ] Criterion 2

## Risks
- Risk 1: [mitigation]

## Estimated Effort
- Phase 1: [hours]
- Phase 2: [hours]
- Total: [hours]
```

## Context to Consider
- Current dashboard structure (single-file HTML/CSS/JS)
- Canvas 2D rendering system (960×480)
- Tab system (projects, prompts, costs, office)
- Agent system with localStorage sync
- Click handler system (OFFICE_HITS)
