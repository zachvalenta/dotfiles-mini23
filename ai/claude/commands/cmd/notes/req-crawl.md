---
description: analyze a job posting against zjv's CV and notes to produce detailed coverage analysis showing what content from notes can be used to address each requirement.
---

# META

INPUTS:
- Job requirement file path (provided as argument)
- CV location: `/Users/zach/Documents/zv/materials/sw/za/profile/cv.md`
- Notes location: `/Users/zach/Documents/zv/notes`
- Note indexes: `/Users/zach/Documents/denv/dotfiles/ai/claude/context/notes`

OUTPUT FORMAT:
For each requirement in the job posting:
1. Requirement statement
2. Content from notes (specific quotes, code examples, concepts with line numbers)
3. CV overlap (what's already on resume)
4. Gap analysis and recommendations

# INSTRUCTIONS

## 1. Read Input Files

First, read these files:
- Job requirement file (path provided as argument)
- CV: `/Users/zach/Documents/zv/materials/sw/za/profile/cv.md`
- Note indexes:
  - `/Users/zach/Documents/denv/dotfiles/ai/claude/context/notes/sw.md`
  - `/Users/zach/Documents/denv/dotfiles/ai/claude/context/notes/domains.md`
  - `/Users/zach/Documents/denv/dotfiles/ai/claude/context/notes/bookcase.md`

## 2. Parse Job Requirements

Extract technical requirements from the job posting:
- Required skills (must-haves)
- Preferred skills (nice-to-haves)
- Tools/technologies mentioned
- Domain knowledge areas
- Soft skills/experience levels

## 3. Identify Relevant Notes

Using the note indexes, identify which note files to load based on:
- TOPICS: High-level themes mentioned in job req
- SEARCH: Keywords from job description
- HEADERS: Specific sections that might be relevant
- RELATED: Follow links to connected concepts

Aim for 5-10 most relevant note files.

## 4. Load Note Files

Read the identified note files from `/Users/zach/Documents/zv/notes/`

## 5. Generate Analysis

For each major requirement, produce a section with:

### Requirement Title
Brief description of what they want

### Content from Notes
- Direct quotes showing knowledge/experience
- Code examples if relevant
- Specific concepts with file paths and line numbers (e.g., `api.md` lines 50-75)
- Frameworks, patterns, best practices mentioned in notes
- Personal debugging stories or examples

### CV Overlap
- What's already on resume that addresses this requirement
- Which roles/projects demonstrate this skill
- Quantifiable metrics if available

### Gap Assessment
- Strong Match (✅): Extensive notes + CV evidence
- Good Match (✅): Good notes, limited CV evidence
- Adequate Match (⚠️): Some notes, needs emphasis
- Gap (❌): Limited or no coverage

## 6. Provide Summary

End with:
- **Overall match score**: X/10 or percentage
- **Strongest areas**: Top 3-5 strengths
- **Areas to emphasize**: What to highlight from notes in interview
- **Resume updates**: Specific additions to make
- **Interview talking points**: Key stories/examples to prepare

# EXAMPLE OUTPUT FORMAT

```markdown
# Job Analysis: [Company Name] - [Position]

## Core Technical Requirements

### 1. [Requirement Name]

**Requirement:**
[Brief description of what they're looking for]

**Content from Notes:**

[Topic from notes] (`file.md` lines X-Y)
- Specific concept or quote
- Code example if applicable
- Framework or pattern knowledge

[Another topic]
- More evidence
- Examples, metrics, etc.

**CV Overlap:**
- **[Role]**: Relevant bullet point or project
- **[Skills section]**: Listed technology

**Assessment:** ✅ Strong Match / ⚠️ Needs Emphasis / ❌ Gap

---

### 2. [Next Requirement]

[Continue same format...]

---

## Summary

**Match Score:** X/10 or X%

**Strongest Areas:**
1. [Area with extensive notes + CV evidence]
2. [Another strong area]
3. [Third strong area]

**Emphasis Strategy:**
- [What to highlight from notes in interview]
- [Specific stories or examples to prepare]
- [Connections between experience and requirements]

**Resume Updates:**
```markdown
[Specific additions to make to CV]
```

**Interview Talking Points:**
- **[Topic]**: "At [Company], I... [story from notes/CV]"
- **[Topic]**: "I have experience with... [reference notes content]"
```

# NOTES

- Be specific: include file paths and line numbers for all note references
- Extract actual content: quotes, code snippets, not just "you have notes on this"
- Focus on depth: show what zjv knows, not just that he knows it
- Be honest about gaps: better to prepare than to oversell
- Connect dots: link related experience even if not obvious match
- Quantify when possible: metrics, scale, impact
- Surface debugging stories and examples from notes as interview material
