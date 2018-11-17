# Change Log
All notable changes to this project will be documented in this file.
This project adheres to [Semantic Versioning](http://semver.org/).


## [3.4] - 2018-11-17

### Added
- Allow different English varieties
- Add `\textcite*` command

### Fixed
- Clear some harmless warnings
- Never abbreviate prefix in citations

### Changed
- Use `uniquename=minfull` for citations
- Replace xstring with l3regex


## [3.3] - 2018-04-04

### Added
- Add `comp` option to numeric style

### Fixed
- Fix problem with English translation


## [3.2] - 2017-10-23

### Added
- Add better tests
- Add `citecount` option

### Changed
- **Support (and require) BibLaTeX 3.8 and Biber 2.8**
- Stop supporting abntex2cite
- Improve abnt citation style (inherit from `authoryear-comp`)
- Use small caps for authors' initials with `sccite` and `scbib` options
- Set language to portuguese automatically
- Disable sortcites


## [3.1] - 2017-07-28

### Added
- Add spanish translation
- Add english translation
- Add `extrayear` option

### Changed
- Use `\raggedright` by default

### Fixed
- Improve `\textapud` with multiple authors


## [3.0.1] - 2017-03-15

### Added
- Add "loc. cit." to `abnt-ibid` style
- Add `\textcite` to `abnt-ibid` style

### Fixed
- Fix citations of articles with no author
- Add ellipsis after abbreviated titles in citations


## [3.0] - 2016-10-13

### Added
- Add examples form NBR 6023:2002
- Add `abnt-ibid` style

### Changed
- Make `bftitles` default and add `ittitles`

### Fixed
- Fix missing parentheses around `authortype`
- Improve `\bibnamedash` behavior
- Fix capitalization of titles in a few entries


## [2.0.1] - 2016-08-03

### Added
- Add CHANGELOG.md
- Improve hyperref links

### Changed
- Make starred commands more consistent

### Fixed
- Improve handling of repeated titles
- Improve sorting for patents
- Allow citing with shorthand


## [2.0] - 2016-07-08

### Added
- Add `abnt-numeric` style

### Removed
- Remove `biblatex`'s deprecated `\nameparts` macro

### Fixed
- Fix problem adding entries with no author
- Fix problem with patent driver


## [1.0.1] - 2016-06-07

### Fixed
- Stop repeating same authors in citations
- Improve handling of small caps
- Improve capitalization of organization fields
- Add "et al." in citations


[3.4]: https://github.com/abntex/biblatex-abnt/compare/v3.3...v3.4
[3.3]: https://github.com/abntex/biblatex-abnt/compare/v3.2...v3.3
[3.2]: https://github.com/abntex/biblatex-abnt/compare/v3.1...v3.2
[3.1]: https://github.com/abntex/biblatex-abnt/compare/v3.0...v3.1
[3.0.1]: https://github.com/abntex/biblatex-abnt/compare/v3.0...v3.0.1
[3.0]: https://github.com/abntex/biblatex-abnt/compare/v2.0.1...v3.0
[2.0.1]: https://github.com/abntex/biblatex-abnt/compare/v2.0...v2.0.1
[2.0]: https://github.com/abntex/biblatex-abnt/compare/v1.0.1...v2.0
[1.0.1]: https://github.com/abntex/biblatex-abnt/compare/v1.0...v1.0.1

