#!/bin/bash
# context.sh - Generate AI-ready context from the ops-dashboard repo
# Usage: ./scripts/context.sh [output_file] [focus_area]

REPO_DIR="$(cd "$(dirname "$0")/.." && pwd)"
OUTPUT="${1:-/tmp/dashboard-context.md}"
FOCUS="${2:-}"

echo "📦 Generating context for ops-dashboard..."

# Generate full codebase context with repomix
repomix --style markdown \
  --output "$OUTPUT" \
  --compress \
  "$REPO_DIR"

# If focus area specified, extract relevant sections
if [ -n "$FOCUS" ]; then
  echo "🔍 Focusing on: $FOCUS"
  FOCUSED="${OUTPUT%.md}-focused.md"
  
  # Extract relevant lines based on focus keyword
  grep -n "$FOCUS" "$REPO_DIR/dashboard.html" | head -20 > "$FOCUSED"
  echo "" >> "$FOCUSED"
  
  # Include surrounding context (20 lines before/after each match)
  grep -B20 -A20 "$FOCUS" "$REPO_DIR/dashboard.html" | head -200 >> "$FOCUSED"
fi

echo "✅ Context saved to: $OUTPUT"
if [ -n "$FOCUS" ]; then
  echo "🎯 Focused context: $FOCUSED"
fi

# Show token estimate (rough: 1 token ≈ 4 chars)
CHARS=$(wc -c < "$OUTPUT")
TOKENS=$((CHARS / 4))
echo "📊 Estimated tokens: ~$TOKENS"
