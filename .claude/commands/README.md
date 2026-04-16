# PRP Commands for Ops Dashboard

Based on [PRPs-agentic-eng](https://github.com/Wirasm/PRPs-agentic-eng) methodology.

## Available Commands

### Feature Development
- `/prp-feature [description]` — Implement a new feature with full context
- `/prp-prd [feature]` — Generate a Product Requirements Document

### Issue Workflow
- `/prp-issue-investigate <number>` — Analyze a GitHub issue
- `/prp-issue-fix <number>` — Implement fix for investigated issue

### Planning
- `/prp-plan [description]` — Create implementation plan
- `/prp-implement <plan-file>` — Execute a plan

### Autonomous
- `/prp-ralph <plan-file>` — Run until all validations pass (max 20 iterations)

### Git & Review
- `/prp-commit` — Smart commit with file targeting
- `/prp-pr [description]` — Create PR with template
- `/prp-review <pr-number>` — Comprehensive PR review

## Scripts

### context.sh
```bash
./scripts/context.sh [output_file] [focus_area]
```
Generates AI-ready context from the codebase using repomix.

### issue-to-prompt.sh
```bash
./scripts/issue-to-prompt.sh <issue_number>
```
Converts a GitHub issue into a ready-to-use AI prompt with full codebase context.

## Quick Start

1. Clone this repo
2. Make sure `gh` CLI is authenticated
3. Run any command: `/prp-feature Add dark mode toggle`
4. For issues: `./scripts/issue-to-prompt.sh 1`

## Artifacts

All artifacts are stored in `.claude/PRPs/`:
- `prds/` — Product requirement documents
- `plans/` — Implementation plans
- `issues/` — Issue investigation reports
- `reports/` — Implementation reports
