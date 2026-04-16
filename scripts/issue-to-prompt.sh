#!/bin/bash
# issue-to-prompt.sh - Convert a GitHub issue into a ready-to-use AI prompt
# Usage: ./scripts/issue-to-prompt.sh <issue_number>

REPO="Mankuy/ops-dashboard"
ISSUE_NUM="$1"

if [ -z "$ISSUE_NUM" ]; then
  echo "Usage: $0 <issue_number>"
  echo ""
  echo "Open issues:"
  gh issue list --repo "$REPO" --state open
  exit 1
fi

echo "📥 Fetching issue #$ISSUE_NUM..."

# Get issue details
ISSUE_JSON=$(gh issue view "$ISSUE_NUM" --repo "$REPO" --json title,body,labels)
TITLE=$(echo "$ISSUE_JSON" | jq -r '.title')
BODY=$(echo "$ISSUE_JSON" | jq -r '.body')
LABELS=$(echo "$ISSUE_JSON" | jq -r '.labels[].name' | tr '\n' ', ')

# Generate codebase context
echo "📦 Generating codebase context..."
repomix --style markdown --compress --output /tmp/dashboard-context.md "$(dirname "$0")/.."

# Build the prompt
PROMPT_FILE="/tmp/issue-${ISSUE_NUM}-prompt.md"

cat > "$PROMPT_FILE" << EOF
# GitHub Issue #${ISSUE_NUM}: ${TITLE}

## Issue Description
${BODY}

## Labels
${LABELS:-none}

## Codebase Context
$(head -100 /tmp/dashboard-context.md)

## Your Task
Based on the issue description above and the codebase context:

1. **Analyze**: What is the root cause or requirement?
2. **Plan**: Write a step-by-step implementation plan
3. **Implement**: Make the necessary changes
4. **Validate**: Ensure nothing breaks (check JS syntax, test in browser)

Remember: This is a single-file HTML/CSS/JS dashboard. All changes go in \`dashboard.html\`.
EOF

echo "✅ Prompt saved to: $PROMPT_FILE"
echo "📋 Preview:"
head -20 "$PROMPT_FILE"

# Copy to clipboard if available
if command -v xclip &>/dev/null; then
  xclip -selection clipboard < "$PROMPT_FILE"
  echo "📋 Copied to clipboard!"
elif command -v pbcopy &>/dev/null; then
  pbcopy < "$PROMPT_FILE"
  echo "📋 Copied to clipboard!"
fi
