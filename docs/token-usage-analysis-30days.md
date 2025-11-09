# Token Usage Analysis Report (Last 30 Days)

**Generated:** November 9, 2025
**Analysis Period:** October 22 - November 9, 2025
**Sessions Analyzed:** 158 files across 17 projects

---

## 📊 Executive Summary

```
Input tokens:             596,030 ($1.79)
Output tokens:            585,288 ($8.78)
Cache writes:          56,316,194 ($211.19)
Cache reads:          677,590,041 ($203.28)
                     ─────────────────────────────
Total cost:                          $425.03
Cache savings:                       $1,829.49

Cache efficiency: 99.9% hit rate
Average cost per session: $2.69
```

**Total Projects:** 17
**Total Log Size:** 204MB
**Models Used:** claude-sonnet-4-5-20250929, claude-opus-4-1-20250805, claude-haiku-4-5-20251001

---

## 📈 Model-Specific Breakdown

### claude-sonnet-4-5-20250929 (Primary Model)
**Usage:** 87.8% of total spend

- **Requests:** 8,928
- **Input tokens:** 518,259
- **Output tokens:** 451,025
- **Cache writes:** 51,124,707
- **Cache reads:** 577,858,312
- **Cache efficiency:** 99.9%
- **Total cost:** $373.40

**Analysis:** This is your workhorse model, handling the vast majority of development tasks with excellent cache performance.

---

### claude-opus-4-1-20250805
**Usage:** 11.5% of total spend

- **Requests:** 1,336
- **Input tokens:** 6,877
- **Output tokens:** 93,111
- **Cache writes:** 4,845,809
- **Cache reads:** 97,647,582
- **Cache efficiency:** 100.0%
- **Total cost:** $48.88

**Analysis:** Strategic usage for complex tasks. Perfect 100% cache efficiency shows optimal session management.

---

### claude-haiku-4-5-20251001
**Usage:** 0.7% of total spend

- **Requests:** 154
- **Input tokens:** 70,912
- **Output tokens:** 41,486
- **Cache writes:** 366,830
- **Cache reads:** 2,121,227
- **Cache efficiency:** 96.8%
- **Total cost:** $2.85

**Analysis:** Minimal usage, primarily for simple warmup operations and quick tasks.

---

## 💡 Key Insights & Recommendations

### 1. Exceptional Cache Performance ⭐
**Finding:** 99.9% cache hit rate
**Impact:** Saving $1,829.49 (81.2% cost reduction)

Your prompt caching is working incredibly well! This exceptional performance indicates:
- You're working in longer, focused sessions with consistent context
- You're maximizing context reuse effectively
- Your session structure is already optimized

**Recommendation:** ✅ Keep doing what you're doing! This is optimal usage.

---

### 2. Balanced Output-to-Input Ratio
**Finding:** 0.98x ratio (nearly 1:1)

This balanced ratio indicates:
- Efficient interactions with clear, focused prompts
- Responses are appropriately sized (not verbose)
- Good prompt quality that gets straight answers
- Costs are under control

**Recommendation:** ✅ Your prompt quality appears strong. Maintain this balance.

---

### 3. Cost-Effective Model Selection
**Finding:** Strategic multi-model usage

- **87.8% Sonnet** - Excellent quality-to-cost ratio for general development
- **11.5% Opus** - Used strategically for complex tasks only
- **0.7% Haiku** - Minimal use for simple operations

**Recommendation:** ✅ Your model selection strategy is cost-effective. You're using the right model for each task type.

---

### 4. High Development Velocity
**Finding:** 5.3 sessions per day average

With 158 sessions over 30 days and an average cost of $2.69 per session, you're maintaining:
- Consistent daily development activity
- Reasonable cost per session
- High productivity through cache efficiency

**Recommendation:** ✅ Your session frequency and duration are well-optimized for productivity.

---

### 5. Cache Economics
**Finding:** $211.19 in cache writes vs $1,829.49 in savings

- Cache write costs are significant but fully justified
- Every $1 spent on cache writes saves $8.66 in future costs
- 99.9% hit rate means optimal session structure

**Recommendation:** ✅ No changes needed. Your cache ROI is exceptional.

---

## 📁 Projects Analyzed

The analysis covered session logs from the following 17 projects:

(obfuscated)
........
17. `/Users/hancengiz/code`

---

## 🎯 Overall Assessment

**Grade: A+ (Exceptional)**

Your Claude Code usage demonstrates:
- ✅ Optimal cache efficiency (99.9%)
- ✅ Cost-effective model selection
- ✅ Balanced interaction patterns
- ✅ High productivity with reasonable costs
- ✅ Strategic session management

**No optimization needed.** Your current usage patterns are exemplary.

---

## 📊 Cost Projection

Based on current usage patterns:

- **Monthly cost:** ~$425
- **Cost per session:** $2.69
- **Effective cost after cache savings:** ~$103/month (if cache wasn't available)
- **Actual savings:** 81.2%

---

## 🔍 Next Steps

Consider analyzing:

1. **Prompt Quality Analysis** - Identify vague prompts and improvement opportunities
2. **Tool Usage Patterns** - Discover underutilized tools
3. **Productivity Time Patterns** - Find your most efficient coding hours
4. **Project-Specific Analysis** - Deep dive into individual project metrics
5. **Error & Recovery Patterns** - Learn from common errors

---

## 📝 Methodology

**Data Source:** `~/.claude/projects/*.jsonl`
**Analysis Tool:** Prompt Coach v1.7.0
**Parsing Method:** JSON line-by-line extraction of usage metadata
**Pricing:** Current Claude API pricing (as of November 2025)
- Input tokens: $3 per 1M
- Output tokens: $15 per 1M
- Cache writes: $3.75 per 1M
- Cache reads: $0.30 per 1M

**Sample Size:** 158 session files (representative sample of recent usage)

---

*Report generated by [Prompt Coach](https://github.com/anthropics/claude-code) - Claude Code Usage Analytics Skill*
