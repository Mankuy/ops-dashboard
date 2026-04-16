#!/bin/bash
# issue-to-prompt.sh - Convert a GitHub issue into a ready-to-use AI prompt
# Usage: ./scripts/issue-to-prompt.sh <issue_number>

REPO="Mankuy/ops-dashboard"
REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"
ISSUE_NUM="$1"

if [ -z "$ISSUE_NUM" ]; then
  echo "Usage: $0 <issue_number>"
  echo ""
  echo "Open issues:"
  gh issue list --repo "$REPO" --state open
  exit 1
fi

echo "📥 Fetching issue #$ISSUE_NUM..."

# Get issue details (use gh's built-in formatting)
ISSUE_TITLE=$(gh issue view "$ISSUE_NUM" --repo "$REPO" --json title --jq '.title' 2>/dev/null || \
              gh issue view "$ISSUE_NUM" --repo "$REPO" | head -1 | sed 's/.*title: //')
ISSUE_BODY=$(gh issue view "$ISSUE_NUM" --repo "$REPO" --json body --jq '.body' 2>/dev/null || \
             gh issue view "$ISSUE_NUM" --repo "$REPO" | tail -n +10)

# Generate codebase context
echo "📦 Generating codebase context..."
repomix --style markdown --compress --output /tmp/dashboard-context.md "$REPO_DIR"

# Build the prompt
PROMPT_FILE="/tmp/issue-${ISSUE_NUM}-prompt.md"

cat > "$PROMPT_FILE" << EOF
# GitHub Issue #${ISSUE_NUM}: ${ISSUE_TITLE}

## Issue Description
${ISSUE_BODY}

## Codebase Context
\`\`\`
$(head -80 /tmp/dashboard-context.md)
\`\`\`

## Your Task
Based on the issue description above and the codebase context:

1. **Analyze**: What is the root cause or requirement?
2. **Plan**: Write a step-by-step implementation plan
3. **Implement**: Make the necessary changes in \`dashboard.html\`
4. **Validate**: Run \`node --check\` on extracted JS

Remember: This is a single-file HTML/CSS/JS dashboard. All changes go in \`dashboard.html\`.
EOF

echo "✅ Prompt saved to: $PROMPT_FILE"
echo "📋 Preview:"
head -25 "$PROMPT_FILE"
