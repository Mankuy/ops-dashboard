# PRP Feature Request

You are working on the **Ops Dashboard** — a single-file HTML/CSS/JS dashboard (~2100 lines) at `D:/CLAUDE/dashboard.html` (WSL: `/mnt/d/CLAUDE/dashboard.html`).

## Project Context
- **Stack**: Pure HTML/CSS/JS, no frameworks, no build tools
- **Canvas**: 960×480 pixel art rendering with requestAnimationFrame
- **Tabs**: Proyectos, Pedidos, Costos, Oficina Pixel Art
- **Agents**: Claude Opus, Grok 4, Gemini 2.5, Hermes v3, Llama 4, Bedel
- **Repo**: https://github.com/Mankuy/ops-dashboard

## Task
$ARGUMENTS

## Your Process
1. **Analyze**: Read the current dashboard code and understand the feature request
2. **Context**: Identify which sections of the file need changes (use line numbers)
3. **Plan**: Write a step-by-step implementation plan with:
   - Which functions to modify/create
   - Which CSS rules to add/modify
   - Any new HTML elements needed
   - Potential conflicts with existing code
4. **Implement**: Make the changes using the Edit tool
5. **Validate**: Run `node --check` on extracted JS to verify syntax
6. **Test**: Describe how to verify the feature works in browser

## Constraints
- Single file — no external dependencies
- Canvas coordinates must scale correctly (CSS width:100%)
- Agent states sync via localStorage
- No breaking existing tab switching or click handlers
