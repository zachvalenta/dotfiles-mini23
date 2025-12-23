# OVERVIEW

LOCATION: `/Users/zach/Documents/zv/notes/bookcase`

## 🏗️ redesign

Notes on books I've read.

Should it be a bibliography mgmt system? Maybe.

Should everything here just be in domains | sw notes instead? Maybe.

# INDEX

## books.md

Reading lists organized by category.

```
├── STEM
│   ├── dev
│   │   └── algos, architecture, data, language, ML, networking, system
│   │   └── SEARCH: Bhargava, Skiena, nand2tetris, Kleppmann, sql, DDD
│   ├── math
│   │   └── general, school, stat, forecasting, game theory, poker
│   │   └── SEARCH: Huff, Silver, Tetlock, superforecasting, Bayes
│   └── science
│       └── medicine, genetics, IQ, biology, physics
│       └── SEARCH: Gawande, Oster, Caplan, bell curve, Mukherjee
├── LIT
│   ├── fiction by region
│   │   └── African (Ghana, Nigeria, South Africa, Sudan)
│   │   └── American (Franzen, Highsmith, McCarthy, Melville, Morrison)
│   │   └── English (Austen, Ishiguro, Maugham, Tolkien, Woolf)
│   │   └── Europe (France, Italy, Germany, Ireland, Russia)
│   │   └── Japan (Kawabata, Tanizaki, Soseki)
│   ├── essays
│   │   └── SEARCH: Didion, Montaigne, Klosterman, Hickey
│   ├── half-realism
│   │   └── SEARCH: Barthelme, Borges, Calvino, Kafka, Marquez
│   ├── poetry
│   │   └── SEARCH: Carson, Whitman, Neruda, haiku
│   └── theatre
│       └── SEARCH: Shakespeare, Sophocles, Aeschylus, Beckett
├── NON-FICTION
│   ├── criticism
│   │   └── SEARCH: Wood, Moretti, distant reading, Auerbach
│   ├── business
│   │   └── SEARCH: Lewis, lean startup, scientific mgmt
│   ├── econ
│   │   └── SEARCH: Hayek, Taleb, Cowen, progress studies, Thiel
│   ├── history
│   │   └── SEARCH: Fukuyama, Diamond, Zeihan, Fischer, Judt
│   ├── music
│   │   └── SEARCH: theory, Levine, Felts, Gioia, recording, guitar, piano
│   ├── philosophy
│   │   └── SEARCH: stoicism, Farnsworth, epistemology, aesthetics
│   ├── politics
│   │   └── SEARCH: identity, institutions, polarization, Scott
│   ├── psychology
│   │   └── SEARCH: Kahneman, Cialdini, influence, social
│   ├── religion
│   │   └── SEARCH: Buddhism, Daoism, Confucius, Bible, Koran
│   └── sociology
│       └── SEARCH: parenting, linguistics, Chinese language
```

RELATED
* `domains/humanities/philosophy.md` - philosophy notes
* `domains/art/music/theory.md` - music theory
* `domains/stem/math/stat.md` - statistics
* `sw/design/data/sql.md` - for database design ideas

## notes/

Individual reading notes: `notes/<media>/<country>/<year-author-title>.md`

FICTION (~65 notes)
* england, france, greece, japan, nigeria, russia, usa, za

MOVIES (~30 notes)
* france (Nouvelle Vague: Godard, Truffaut, Malle, Melville)
* japan (Kurosawa, Ozu)
* usa (Linklater, Coppola, Tarantino, Mann)

## tooling

* `cli.py`, `er-model.sql`, `Makefile`, `seed.sql`
* ER model: book, author, reading, genre, location
