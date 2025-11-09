# Prompt Coach - Claude Code Usage Analytics Skill

A Claude Code skill that analyzes your session logs to provide insights about your coding patterns, token usage, productivity, and prompt quality.

## What This Does

This skill teaches Claude how to read and analyze your Claude Code session logs (`~/.claude/projects/*.jsonl`) to help you:

- ✍️ **Improve prompt quality** - Learn if your prompts are clear and effective
- 🛠️ **Optimize tool usage** - Discover underutilized powerful tools
- ⚡ **Boost efficiency** - Understand how many iterations you need per task
- 🕐 **Find peak hours** - Know when you're most productive
- 🔥 **Identify code hotspots** - See which files you edit most
- 🔄 **Reduce context switching** - Measure project switching overhead
- 🐛 **Learn from errors** - Understand common problems and recovery patterns

## Installation

### Quick Install (Recommended)

Run the install script:

```bash
cd ~/code/claude-code-prompt-coach
./install.sh
```

The script will:
- ✅ Create `~/.claude/skills/` if needed
- ✅ Check for existing installations
- ✅ Copy the skill to the correct location
- ✅ Verify installation
- ✅ Show next steps

Restart Claude Code and you're done!

### Manual Install

Copy the skill directory to your Claude skills folder:

```bash
cp -r ~/code/claude-code-prompt-coach ~/.claude/skills/prompt-coach
```

### For Development (Symlink)

Create a symlink to the skill directory:

```bash
ln -s ~/code/claude-code-prompt-coach ~/.claude/skills/prompt-coach
```

Now you can edit `Skill.md` and changes take effect on next Claude Code restart.

## Usage

Just ask Claude natural questions about your usage:

```
"How much have I spent on tokens this month?"

"Analyze my prompt quality from last week"

"Which tools do I use most?"

"Show me my productivity patterns"

"What files do I edit most often?"

"When am I most efficient?"
```

Claude will automatically read your session logs and provide detailed analysis.

## Example Output

### Token Usage Analysis
```
📊 Token Usage Analysis (Last 30 Days)

Input tokens:        450,000 ($1.35)
Output tokens:       125,000 ($1.88)
Cache writes:        200,000 ($0.75)
Cache reads:       1,500,000 ($0.45)
                    ─────────────────
Total cost:                   $4.43
Cache savings:                $4.05

Cache efficiency: 75% hit rate

💡 Tip: Your cache hit rate is excellent! You're saving ~$4/month
by keeping focused sessions.
```

### Prompt Quality Analysis
```
📝 Prompt Quality Analysis

Total prompts: 145
Needed clarification: 51 (35%)
Average prompt score: 5.2/10 (Good, room for improvement)

🔴 Areas for Improvement:

Common issues (mapped to Claude best practices):

1. Missing Context (42% of clarifications)
   ❌ "fix the bug"
   ✅ "fix the authentication error in src/auth/login.ts where JWT validation fails with 401"

   💡 Best Practice: Provide contextual information
   - Include file paths, error messages, expected behavior

2. Too Vague/Broad (28% of clarifications)
   ❌ "update the component"
   ✅ "update the Button component to use design system colors from design-tokens.ts"

   💡 Best Practice: Be clear and direct
   - Specify WHICH component, WHAT to update, success criteria

📊 Prompt Quality Score Breakdown:
- Excellent (8-10): 23 prompts (16%)
- Good (5-7): 71 prompts (49%)
- Needs Work (3-4): 38 prompts (26%)
- Poor (0-2): 13 prompts (9%)

🎯 Top Recommendations:
1. Apply "The Golden Rule": Would a colleague understand without context?
2. Use the "Be Clear and Direct" technique (most effective)
3. Include file paths in 80% of code-related prompts

💪 Focus on these improvements to reduce clarifications by ~50%.
```

### Tool Usage Patterns
```
🛠️ Tool Usage Patterns (Last 30 Days)

Most used tools:
1. Read         ████████████████████ 450 uses
2. Edit         ████████████         220 uses
3. Bash         ███████              150 uses
4. Grep         ██                    34 uses

💡 Insights:

✅ Good: You use Read heavily - shows careful code review
⚠️  Opportunity: Low Grep usage (34 uses vs 450 Reads)
   → Try Grep for searching across multiple files
   → It's much faster than reading each file
```

## Available Analysis Types

1. **Token Usage & Cost Tracking** - Detailed breakdown with current pricing
2. **Prompt Quality Scoring** - How often your prompts need clarification
3. **Tool Usage Patterns** - Which tools you use most/least
4. **Session Efficiency** - Average iterations per task
5. **Productivity Time Patterns** - Best hours and days to code
6. **File Modification Heatmap** - Most frequently edited files
7. **Error & Recovery Analysis** - Common errors and how long they take to fix
8. **Project Switching Analysis** - Context switching costs

## How It Works

The skill provides Claude with:
- **Official Claude prompt engineering best practices** from Anthropic's documentation
- Knowledge of where logs are stored (`~/.claude/projects/`)
- Understanding of the JSONL log format
- A scoring system for prompt quality (Clarity, Specificity, Actionability, Scope)
- Patterns to look for (tool usage, tokens, timestamps, etc.)
- Instructions on how to calculate metrics
- Templates for presenting insights

Claude then uses its built-in tools (Read, Bash, Grep) to:
1. Find and read your log files
2. Parse the JSON data
3. Score your prompts against official best practices
4. Calculate metrics
5. Generate personalized, actionable insights

**No external dependencies, no installations, no data leaving your machine.**

## Prompt Engineering Knowledge

The skill is trained on official Claude prompt engineering guidelines, including:

### The Golden Rule
**"Show your prompt to a colleague with minimal context. If they're confused, Claude will likely be too."**

### Prompt Engineering Hierarchy (What Works Best)
1. ⭐ **Be Clear and Direct** - Most effective
2. **Use Examples (Multishot)** - Show desired output
3. **Let Claude Think** - Chain of thought reasoning
4. **Use XML Tags** - Structure for clarity
5. **Give Claude a Role** - Set context
6. **Prefill Responses** - Guide output format
7. **Chain Complex Prompts** - Break into steps

When analyzing your prompts, the skill evaluates them against these techniques and provides specific recommendations for improvement.

## Privacy

- ✅ All data stays local on your machine
- ✅ No external services called
- ✅ No tracking or analytics
- ✅ You control the skill file

## Customization

Want to add your own analysis types? Just edit `Skill.md` and add:

```markdown
### 9. Your Custom Analysis

**When asked about [your topic]:**

**Steps:**
1. Read session files
2. Look for [pattern]
3. Calculate [metric]
4. Present [insights]
```

## Example Queries

**Costs:**
- "How much have I spent this month?"
- "What's my cache efficiency?"
- "Show me costs by model"

**Productivity:**
- "When am I most productive?"
- "How efficient are my sessions?"
- "Show me my coding patterns from last week"

**Code Patterns:**
- "Which files do I edit most?"
- "What projects do I work on?"
- "Show me my file modification heatmap"

**Learning:**
- "Am I writing good prompts?"
- "Which tools should I use more?"
- "What are my common errors?"

## Troubleshooting

**Skill not working?**

1. Verify installation:
   ```bash
   ls -la ~/.claude/skills/prompt-coach/Skill.md
   ```

2. Restart Claude Code completely

3. Try being explicit:
   ```
   "Use the Prompt Coach skill to analyze my prompt quality"
   ```

**Need more detail?**

Ask follow-up questions:
```
"Show me specific examples of vague prompts I wrote"
"Break down my token usage by project"
"Which Tuesdays was I most productive?"
```

## Requirements

- Claude Code CLI (any recent version)
- Session logs in `~/.claude/projects/` (automatically created by Claude Code)

## License

MIT

## Contributing

Found a useful analysis pattern? Edit the skill and share!

Ideas for new analysis types:
- Git commit patterns
- Language/framework usage
- Collaboration patterns (if analyzing team logs)
- Learning curve tracking over time
- Custom benchmarks against your own history

## Credits

Built for developers who want to optimize their Claude Code usage and improve their coding workflows.
