# howto

* link to other notes / headers: `🗄️ /path/to/note > header`
* blockquote: `>`
* horizontal rules (`---`) split a header into stuff that is more polished (above the horizontal rule) and stuff that's more of a mess (below the horizontal rule)

# example

Here's an example of how I write Markdown:

```markdown
## architecture

💡 separate db per event: named by `event_id`, isolates event data and promotes parallelism

TYPES
* _event_: live feed data (pbp, markets, stats)
* _rmg_: static reference data (team mappings, trivia)
* _snapshot_: backups of feed data
* _pricing_: player stats, feature mappings
```

You'll notice:

* italics (not bold) for entities like _event_ and _rmg_
* all caps [not followed by a colon] to create something akin to a separate namespace w/in a doubly nested header
* top-level headers are all caps
* second-level headers are only capitalized if they contain a proper noun
```sh
$ ext OLTP.md  # tool I wrote to extract headers from Markdown files

🌐️ DISTRIBUTED / NEWSQL
	🪳 CockroachDB
	🌐 PlanetScale
	🐯 TigerBeetle
```

# nesting

* I disagree w/ the idea of a single top-level header per file. That is a waste of namespace. The file name itself tells one the main topic. No need to repeat with a single top-level header.
* Instead, treat headers like a file system. Top-level, second-level and so on.
* The goal is to have no more than two levels of nesting (top-level, second-level) per document. Typically - but not always - more nesting than that is a sign that your domain is complex enough to merit multiple files vs. greater nesting.
* Any topics that don't fit cleanly under the primary top-level headers for a document - that are miscellaneous - should be grouped under a final top-level leader `# 🟨 ZA` (杂 = miscellaneous).

# cleanup

All notes follow this structure:

```markdown
# ⛩️

## 参考

🔍 <search/reference sites>
📚 <reading list>
* ✅ = read
* ⭐️ = priority

## 进步

* _YY_: what I learned/did that year

# <TOPIC SECTIONS>
```

CONVENTIONS
* `🗄️` cross-reference to other notes
* `📙` inline book reference with page: `📙 Author [page]`
* `📻` music example
* `📹` video reference
* `>` blockquotes for passages/quotes
* `---` horizontal rule separates subsections
* ALL CAPS for categorical labels within sections
