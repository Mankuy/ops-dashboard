# PRP Ralph — Autonomous Implementation Loop

Execute a plan autonomously until all validations pass.

## Arguments
$ARGUMENTS — path to plan file (e.g., `.claude/PRPs/plans/my-feature.plan.md`)

## Your Process

1. **Read the plan** at the path specified in $ARGUMENTS
2. **Execute each task** in order:
   - Make the code changes described
   - After each task, run validation
3. **Validate** after EVERY task:
   ```bash
   # Extract JS and check syntax
   node --check /tmp/dashboard_extracted.js
   
   # Check file integrity
   wc -l dashboard.html
   grep -c '</html>' dashboard.html  # Should be exactly 1
   ```
4. **If validation fails**:
   - Fix the error
   - Re-validate
   - Continue
5. **Mark tasks complete** by updating the plan file status
6. **Loop** until all tasks are done
7. **Final report**: Save to `.claude/PRPs/reports/[plan-name]-report.md`

## Rules
- Max iterations: 20 (prevent infinite loops)
- Never skip validation
- If stuck on a task for 3+ attempts, escalate with `Ralph: STUCK on task X`
- Always end with `<promise>COMPLETE</promise>` or `<promise>STUCK</promise>`

## Stop Condition
When all validations pass and all tasks complete:
```
<promise>COMPLETE</promise>
```
