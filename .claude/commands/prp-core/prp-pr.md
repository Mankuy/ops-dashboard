# PRP — Create Pull Request

Create a PR from the current changes.

## Your Process

1. **Check current state**:
   ```bash
   git status
   git diff --stat
   ```

2. **Create branch** (if not on one):
   ```bash
   git checkout -b feature/$ARGUMENTS
   ```

3. **Stage and commit**:
   ```bash
   git add .
   git commit -m "feat: $ARGUMENTS"
   ```

4. **Push and create PR**:
   ```bash
   git push -u origin feature/$ARGUMENTS
   gh pr create \
     --repo Mankuy/ops-dashboard \
     --title "feat: $ARGUMENTS" \
     --body "## Changes
   $(git log --oneline -5)
   
   ## Testing
   - [ ] JS syntax check passed
   - [ ] All tabs functional
   - [ ] Click handlers work
   - [ ] Canvas renders correctly
   
   Closes #[issue-number-if-any]"
   ```

5. **Report**: Share the PR link with the user
