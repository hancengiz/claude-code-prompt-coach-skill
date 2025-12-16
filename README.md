# Prompt Coach - Claude Code Usage Analytics Skill

A Claude Code skill that analyzes your session logs OR current conversations to provide insights about your coding patterns, token usage, productivity, and prompt quality. Works in Claude Code CLI, GitHub Copilot Chat, and any environment with Claude skills support.

## What This Does

This skill teaches Claude how to analyze your coding sessions in two ways:

### 📊 Historical Analysis (Claude Code logs)
Analyze your Claude Code session logs (`~/.claude/projects/*.jsonl`):
- 💰 **Token usage & costs** - Track spending across models (Opus, Sonnet, Haiku)
- ✍️ **Prompt quality** - Learn if your prompts are clear and effective
- 🎯 **Real examples** - See actual vague prompts from your logs with before/after improvements
- 🛠️ **Tool usage** - Discover underutilized powerful tools and MCP adoption
- ⚡ **Session efficiency** - Understand how many iterations you need per task
- 🕐 **Productivity patterns** - Know when you're most productive
- 🔥 **Code hotspots** - See which files you edit most
- 🔄 **Context switching** - Measure project switching overhead
- 🐛 **Error patterns** - Understand common problems and recovery

### 💬 Current Conversation Analysis (NEW!)
Analyze the conversation happening right now:
- ✍️ **Real-time prompt feedback** - Get instant coaching on your prompts
- 🎯 **Context-aware analysis** - Detects vague vs clear prompts
- 📋 **Actionable suggestions** - Receive specific improvements
- 🤝 **Cross-platform** - Works in Copilot Chat, Claude Code, anywhere with Claude skills

## Installation

### Quick Install (Recommended)

Run the install script:

```bash
cd ~/code/claude-code-prompt-coach-skill
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
cp -r ~/code/claude-code-prompt-coach-skill ~/.claude/skills/prompt-coach
```

### For Development (Symlink)

Create a symlink to the skill directory:

```bash
ln -s ~/code/claude-code-prompt-coach-skill ~/.claude/skills/prompt-coach
```

Now you can edit `Skill.md` and changes take effect on next Claude Code restart.

### For GitHub Copilot Chat Users 🤝

1. Install the skill using one of the methods above
2. Enable Claude skills in VS Code:
   - Open VS Code Settings (`Cmd+,` or `Ctrl+,`)
   - Search for `chat.useClaudeSkills`
   - Set to `true`
3. Restart VS Code
4. In Copilot Chat window, invoke skill naturally:
   ```
   "Analyze this conversation using Prompt Coach"
   "Review my prompt quality in this chat"
   "How good are my prompts in this conversation?"
   ```

**Note:** In Copilot Chat, only **prompt quality analysis** is available (no token usage, tool tracking, or time patterns since the conversation context doesn't include that metadata).

## Usage

**IMPORTANT:** This skill analyzes logs from **THIS machine only**. It can only access Claude Code session logs stored locally in `~/.claude/projects/`.

### Option 1: Analyze All Projects

Just ask Claude natural questions about your usage across all projects:

```
"How much have I spent on tokens this month?"
"Analyze my prompt quality from last week"
"Which tools do I use most?"
"Show me my productivity patterns"
"What files do I edit most often?"
"When am I most efficient?"
```

Claude will automatically read all your session logs and provide detailed analysis.

### Option 2: List Projects First, Then Pick One

If you want to see what projects have logs and choose one:

```
"List all projects with Claude Code logs"
"Show me which projects I've worked on"
"What projects do I have session logs for?"
```

Claude will show you all available projects with details (sessions count, date range, size), and you can pick which one to analyze.

### Option 3: Analyze a Specific Project

If you know the project path, analyze just that project:

```
"Analyze my prompt quality for the project under ~/code/youtube/transcript/mcp"

"Analyze my prompt quality for /Users/username/code/my-app and save it as report.md"

"Show me token usage for the project in ~/code/experiments"

"What tools do I use most in the ~/code/my-app project?"
```

This analyzes **only the logs for that specific project**, giving you focused insights.

### Option 4: Analyze Current Conversation 💬

**NEW!** You can analyze the conversation happening right now without needing log files:

```
"Analyze this conversation"
"How good are my prompts in this chat?"
"Review the prompt quality in this current session"
"Give me feedback on this conversation"
```

Claude will review all user prompts in the current conversation, score them, and provide specific improvement suggestions.

**Perfect for:**
- Quick feedback while chatting (especially in Copilot Chat)
- Learning prompt engineering in real-time
- Getting instant coaching without historical data

**Limitations:** Only prompt quality analysis available (no token/cost data, tool tracking, or time patterns).

## Use Cases

### Scenario 1: Real-time Learning (Copilot Chat)
You're working in VS Code with Copilot Chat and want to improve your prompts:

```
You: "Create a login form component"
Copilot: [creates component]
You: "Add validation"
Copilot: [adds validation]
You: "Analyze this conversation"
Copilot: *Reviews your prompts and provides scores/suggestions:
  - "Create a login form component" (7/10) - Good but could specify framework
  - "Add validation" (5/10) - Vague - which fields? What validation rules?
  Suggestions: Be specific about requirements upfront...*
```

### Scenario 2: Historical Analysis (Claude Code)
You want comprehensive metrics on your Claude Code usage:

```bash
claude

You: "Give me a general analysis of my Claude Code usage"
Claude: *Reads logs, analyzes tokens, tools, time patterns, etc.
        Generates comprehensive report with cost breakdown,
        prompt quality scores, tool usage heatmap, and more*
```

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
📝 Prompt Quality Analysis (Last 14 Days)

Total prompts: 145
Needed clarification: 51 (35%)
Average prompt score: 5.2/10 (Good, room for improvement)

🚩 Most Common Missing Elements:
1. File paths: Missing in 61 prompts (42%)
2. Error details: Missing in 34 prompts (23%)
3. Success criteria: Missing in 43 prompts (30%)
4. Specific approach: Missing in 28 prompts (19%)

🔴 Real Examples from Your Logs:

**Example 1: Missing File Context**
❌ Your prompt: "fix the bug"
🤔 Claude asked: "Which file has the bug? What's the error message or symptom?"
✅ Better prompt: "fix the authentication bug in src/auth/login.ts where JWT validation fails with 401 error"
📉 Cost: +2 minutes, +1 iteration

**Example 2: Vague Action Words**
❌ Your prompt: "optimize the component"
🤔 Claude asked: "Which component? What performance issue? What's the target?"
✅ Better prompt: "optimize UserList component in src/components/UserList.tsx by adding React.memo to reduce unnecessary re-renders when parent updates"
📉 Cost: +3 minutes, +1 iteration

**Example 3: Missing Approach**
❌ Your prompt: "add caching"
🤔 Claude asked: "Where should caching be added? What caching strategy? (Redis, memory, file-based?)"
✅ Better prompt: "add Redis caching to the API responses in src/api/client.ts with 5-minute TTL, similar to how we cache user data"
📉 Cost: +4 minutes, +2 iterations

📉 Impact Analysis:
- 51 prompts needed clarification
- Average time lost per clarification: 2.8 minutes
- Total time lost to vague prompts: ~2.4 hours
- **Potential time savings: ~1.2 hours by improving top 25 vague prompts**

🎯 Your Top 3 Improvements (Maximum Impact):

**1. Always Include File Paths (42% of clarifications)**
   Template: "[action] in [file path] [details]"
   💰 Impact: Would eliminate ~21 clarifications (~1 hour saved)

**2. Provide Error Details When Debugging (23% of clarifications)**
   Template: "fix [error message] in [file] - expected [X], getting [Y]"
   💰 Impact: Would eliminate ~12 clarifications (~25 min saved)

**3. Define Success Criteria for Vague Actions (30% of clarifications)**
   Instead of: "optimize", "improve", "make better"
   Use: "[action] to achieve [specific measurable outcome]"
   💰 Impact: Would eliminate ~15 clarifications (~40 min saved)

💡 Quick Win: Apply these templates to your next 10 prompts and watch your clarification rate drop!

💪 You're doing well! Your prompts are 65% effective. Focus on these 3 improvements and you'll hit 85%+ effectiveness, saving ~1-2 hours per week.
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
2. **Enhanced Prompt Quality Analysis** ⭐ NEW! - Advanced analysis that:
   - Detects vague prompt patterns (missing file paths, error details, success criteria)
   - Shows real examples from YOUR logs with what Claude had to ask
   - Provides before/after improvements for actual prompts you wrote
   - Calculates time/iteration cost of unclear prompts
   - Gives actionable templates ranked by impact
   - Identifies most common missing elements in your prompts
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

## Skill Design: Prompt Engineering in Action

The `Skill.md` file itself is a masterclass in prompt engineering, practicing what it preaches. Here's how it's constructed:

### Core Techniques Applied

**1. Clear Role Definition (System Prompts)**
- Establishes Claude as "an AI-native engineering expert and prompt engineering specialist"
- Defines domain expertise upfront (lines 9-15)
- Sets clear expectations for behavior and knowledge

**2. Hierarchical Structure & Organization**
- Markdown headers create clear information hierarchy
- Numbered step-by-step instructions for each analysis task
- Visual indicators (emojis, ASCII art) for quick pattern recognition
- Logical flow from general concepts to specific implementations

**3. Extensive Examples (Multishot Prompting)**
- Full example outputs for every analysis type (Token Usage, Prompt Quality, etc.)
- Before/after comparisons showing good vs. bad prompts
- Real-world scenarios with context-aware scoring
- Template patterns for reusable prompt structures

**4. Step-by-Step Instructions (Chain of Thought)**
- Each analysis task includes 5-10 explicit steps
- Sequential reasoning from data collection to insight generation
- Clear decision trees (e.g., context-aware analysis logic)
- Systematic approach to subjective evaluation

**5. Specificity & Actionability**
- Exact file paths: `~/.claude/projects/*.jsonl`
- Precise JSON field names: `usage.input_tokens`, `message.content`
- Current pricing data: $3 per 1M input tokens
- Specific patterns to detect: "Could you clarify", "Which file"
- Concrete scoring criteria: Clarity (0-10), Specificity (0-10)

**6. Success Criteria Definition**
- Explicit scoring guidelines with ranges (8-10 = Excellent, 5-7 = Good, etc.)
- Examples of what scores mean in practice
- Clear metrics for evaluation (clarification rate, iteration count)
- Quantified outcomes (time saved, efficiency improvements)

**7. Edge Cases & Error Handling**
- Explicit limitations section (what CAN'T be analyzed)
- Context-aware analysis with conditional logic
- Privacy considerations and parsing safeguards
- Handling of ambiguous or brief prompts with environmental context

**8. Templates & Reusable Patterns**
- Prompt templates: `"[action] in [file path] [details]"`
- Error reporting template: `"fix [error message] in [file] - expected [X], getting [Y]"`
- Success criteria template: `"[action] to achieve [specific measurable outcome]"`
- Analysis output format templates for consistency

**9. Comparative Analysis (Good vs Bad)**
- Systematic contrasts between effective and ineffective approaches
- Context-rich brief prompts (✅ "git commit") vs context-poor vague prompts (❌ "fix the bug")
- Visual markers (✅/❌) for instant clarity
- Explanations of why each example works or fails

**10. Meta-Instructions & Critical Insights**
- "Understanding Context in Prompt Quality" section teaches analysis methodology
- Two dimensions of quality: explicit information + implicit context
- Recognition patterns for different types of context (git, file, conversation)
- Nuanced guidance on when brevity is good vs. when it's problematic

### Why This Design Works

The skill file follows the **same hierarchy** it teaches (lines 160-197 in Skill.md):

1. ⭐ **Clear and Direct** - Every instruction is explicit and unambiguous
2. **Examples** - Demonstrates desired outputs with real-world scenarios
3. **Chain of Thought** - Breaks complex analysis into step-by-step processes
4. **Structure** - XML-like markers and markdown for organization
5. **Role Definition** - Sets expertise context upfront
6. **Templates** - Provides reusable patterns
7. **Chaining** - Sequences of steps for complex tasks

### Design Principles Used

- **No Ambiguity**: Every term is defined, every pattern is specified
- **Actionable Instructions**: Claude knows exactly what to do at each step
- **Context-Aware**: Recognizes when brevity is efficient vs. when it's vague
- **Example-Rich**: Shows don't tell - extensive demonstrations of desired behavior
- **Self-Referential**: The skill itself models excellent prompt engineering

This meta-design approach ensures that Claude not only *knows* prompt engineering best practices but actively *demonstrates* them when teaching users about their own prompts.

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

### General Analysis (All Projects)

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
- "Show me my file modification heatmap"

**Learning:**
- "Am I writing good prompts?"
- "Analyze my prompt quality and show me real examples of vague prompts I wrote"
- "What are the most common things missing from my prompts?"
- "Show me before/after examples of how to improve my prompts"
- "How much time am I losing to unclear prompts?"
- "Give me templates for better prompts based on my usage patterns"
- "Which tools should I use more?"
- "What are my common errors?"

### Project Discovery

- "List all projects with Claude Code logs"
- "Show me which projects I've worked on"
- "What projects do I have session logs for?"
- "Which project have I spent the most time on this week?"

### Project-Specific Analysis

- "Analyze my prompt quality for the project under ~/code/youtube/transcript/mcp"
- "Show me token usage for the project in ~/code/my-app"
- "What tools do I use most in the ~/code/experiments project?"
- "How efficient are my sessions for /Users/username/code/my-project?"
- "Which files do I edit most in the ~/code/dotfiles project?"
- "Analyze my prompt quality for ~/code/my-app and save it as reports/prompt-analysis.md"

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
