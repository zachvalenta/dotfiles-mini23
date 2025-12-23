# OVERVIEW

LOCATION: `/Users/zach/Documents/zv/notes/bookcase`

PURPOSE
* track books/films read/watched
* store reading notes (quotes, summaries, reactions)
* maintain reading lists by topic

## 🏗️ redesign

Notes on books I've read.

Should it be a bibliography mgmt system? Maybe.

Should everything here just be in domains | sw notes instead? Maybe.

# STRUCTURE

## notes

Reading notes live in `notes/<media>/<country>/<year-author-title>.md`

MEDIA
* _fiction_: novels, short stories, plays, poetry
* _movies_: film notes

COUNTRIES
* england, france, greece, japan, nigeria, russia, usa
* _za_: miscellaneous (杂) - German, Irish, Chinese, Norwegian authors

FILENAME CONVENTION
* `<year> - <author> <title>.md` (usa/england)
* `<year>-<author>-<title>.md` (elsewhere)
* ancient works use approximate dates: `0800-homer-iliad.md`

## reading lists

`books.md` contains reading lists organized by domain:

STEM
* dev (algos, architecture, data, language, ML, networking, system)
* math (general, school, stat, forecasting, game theory, poker)

Other domains include: science, humanities, business, etc.

FORMAT
* `✅` = read
* bare entry = to read / owned

## tooling

* `cli.py`: CLI for managing entries
* `er-model.sql`: database schema for books, authors, readings, genres
* `Makefile`: build/maintenance tasks
* `seed.sql`: sample data

# ER MODEL

Core entities from `er-model.sql`:
* _book_: title, pub_date, publisher, favorite, location (mine/parents/friends)
* _author_: gname, sname, nationality, gender, active dates
* _reading_: book_id, is_active, complete, occasion, comments (jsonb)
* _genre_: genre taxonomy
* _location_: where physical copy lives

# USE CASES

When working with bookcase:
* adding notes for a new book/film
* querying reading history
* maintaining reading lists in `books.md`
* cross-referencing with domain notes (e.g. `🗄️ sociology.md`)
* exporting to site (book reviews section)
