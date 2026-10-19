# APA 7 LaTeX Template

A ready-to-use template for writing papers in APA 7th edition style with LaTeX.
It compiles locally, on Overleaf, and on GitHub (every push builds a PDF).

It uses the [`apa7`](https://ctan.org/pkg/apa7) document class by Daniel A. Weiss and
[`biblatex-apa`](https://ctan.org/pkg/biblatex-apa) for citations and references.

> **Note:** `apa7` is a community-maintained LaTeX class, not an official product of the
> American Psychological Association. It follows the APA 7 manual closely, but always
> check your instructor's or journal's requirements.

## What's inside

```
├── main.tex              # entry point: title page, mode, metadata
├── sections/             # one file per section of the paper
├── figures/              # put your images here
├── refs.bib              # your references (BibTeX/biblatex format)
├── docs/                 # APA 7 student paper format reference
├── .latexmkrc            # build settings (XeLaTeX + biber, aux files in build/)
├── .vscode/settings.json # one-click builds in VS Code
└── .github/workflows/    # builds the PDF on GitHub
```

## Quick start

1. Click **Use this template** → **Create a new repository** at the top of this page,
   then clone your new repository:
   ```bash
   git clone https://github.com/<your-username>/<your-repo>.git
   ```
2. Install LaTeX (see [Installation](#installation)). Skip this if you only use Overleaf.
3. Edit the title page fields in `main.tex` and write your paper in `sections/`.
4. Build the PDF: `latexmk main.tex` → `main.pdf` appears next to `main.tex`.

## Installation

You need two things: a **TeX distribution** (the LaTeX compiler and packages) and an
**editor**. If you have never used LaTeX before, follow the recommended path.

### Step 1: Install a TeX distribution

**Recommended: a full distribution.** It is large (5–8 GB, roughly 30–60 minutes to
install), but it includes every package this template needs, so nothing will be missing.

| System  | What to install | How |
|---------|-----------------|-----|
| macOS   | **MacTeX** | Download `MacTeX.pkg` from [tug.org/mactex](https://www.tug.org/mactex/) and run it. Or with Homebrew: `brew install --cask mactex` |
| Windows | **TeX Live** | Download `install-tl-windows.exe` from [tug.org/texlive/windows.html](https://tug.org/texlive/windows.html) and run it with the default options. |
| Linux (Debian/Ubuntu) | **TeX Live full** | `sudo apt install texlive-full` |

After installing, **close and reopen your terminal** (on macOS, reopen VS Code too) so the
new commands are found.

<details>
<summary><b>Lightweight alternative (a few hundred MB, more steps)</b></summary>

Use this if you are short on disk space. You install a small distribution and then add
the few extra packages this template needs.

- **macOS: BasicTeX.** Download `BasicTeX.pkg` from [tug.org/mactex/morepackages.html](https://www.tug.org/mactex/morepackages.html)
  (or `brew install --cask basictex`), reopen the terminal, then run:
  ```bash
  sudo tlmgr update --self
  ```
  ```bash
  sudo tlmgr install latexmk apa7 biblatex biblatex-apa biber csquotes endfloat mwe scalerel threeparttable fontspec unicode-math tex-gyre tex-gyre-math
  ```
- **Windows: MiKTeX.** Install [MiKTeX](https://miktex.org/download). On the first build it
  offers to download missing packages: choose **Install** (and untick "Always show this
  dialog" to stop it asking). `latexmk` also needs Perl: install
  [Strawberry Perl](https://strawberryperl.com/).
- **Linux (Debian/Ubuntu):**
  ```bash
  sudo apt install latexmk biber texlive-xetex texlive-latex-extra texlive-bibtex-extra texlive-publishers tex-gyre
  ```

If a build later fails with ``File `something.sty' not found``, a package is missing.
On macOS/Linux with TeX Live, install it with `sudo tlmgr install <package-name>`;
search for the right name at [ctan.org](https://ctan.org/).

</details>

### Step 2: Check that it works

Open a terminal and run:

```bash
latexmk -v
```

```bash
biber -v
```

Both should print a version number. If you see `command not found`, reopen the terminal
(or restart your computer) and try again.

### Step 3: Install an editor (recommended: VS Code)

1. Install [Visual Studio Code](https://code.visualstudio.com/).
2. Install the **LaTeX Workshop** extension (search for it in the Extensions panel).
3. Open this repository's folder in VS Code (**File → Open Folder…**) and open `main.tex`.
4. Save the file (<kbd>Cmd</kbd>/<kbd>Ctrl</kbd> + <kbd>S</kbd>). It builds automatically.
   Click the **View LaTeX PDF** icon (top right) to see the PDF next to your text.

The included `.vscode/settings.json` already configures LaTeX Workshop for this template.

### Step 4: Build from the terminal (optional)

From the repository folder:

```bash
latexmk main.tex
```

`latexmk` runs XeLaTeX and biber as many times as needed. The PDF is `main.pdf`;
auxiliary files go to `build/`. To delete them, run `latexmk -c`.

## Use on Overleaf

1. On GitHub, click **Code → Download ZIP**.
2. On [Overleaf](https://www.overleaf.com/), click **New Project → Upload Project** and
   choose the ZIP file.
3. If `.latexmkrc` appears in the Overleaf file list, delete it. Overleaf manages its own
   build folder, and a custom one can break its PDF preview.
4. Open **Menu** and set **Compiler** to **XeLaTeX** and **Main document** to
   `main.tex`. Overleaf detects biber automatically.

## Font

The paper is set in **Times New Roman 12 pt**, as in the APA student sample paper. This
needs XeLaTeX (already set in `.latexmkrc`, VS Code, and the GitHub workflow), because
pdfLaTeX cannot use fonts installed on your computer.

Times New Roman comes with macOS and Windows. If it is not installed (Linux, GitHub
Actions, possibly Overleaf), the build falls back to **TeX Gyre Termes**, a free Times
clone, and the log shows `Times New Roman not found, using TeX Gyre Termes`. The two look
almost identical, but if your instructor requires Times New Roman exactly, **submit the PDF
you build on your own Mac or Windows computer**, not the one from GitHub Actions.

To check which font a PDF uses, open it and look at **File → Properties → Fonts**, or run
`pdffonts main.pdf`.

## Switching modes

Change the first option of `\documentclass` in `main.tex`:

| Mode  | Use it for |
|-------|------------|
| `stu` | Student paper (default): title page with course, instructor, and due date |
| `man` | Manuscript for journal submission: running head, author note |
| `jou` | Looks like a published APA journal article (two columns) |
| `doc` | Plain LaTeX document layout (single column) |

In `man` mode, uncomment `\shorttitle` and `\authornote` in `main.tex`.

By default, `floatsintext` keeps figures and tables where you place them. Remove it to
move all figures and tables after the reference list, which some instructors and journals
require.

## Common tasks

- **Cite:** `\parencite{key}` → (Smith & Lee, 2021); `\textcite{key}` → Smith and Lee (2021);
  with a page: `\parencite[p.~42]{key}`.
- **Add a reference:** add an entry to `refs.bib`. Most reference managers (Zotero,
  Mendeley) can export BibTeX. Use the [biblatex-apa docs](https://ctan.org/pkg/biblatex-apa)
  for entry types.
- **Add a figure:** put the image in `figures/` and replace `example-image` in
  `sections/results.tex` with its file name. Then remove `\usepackage{mwe}` from `main.tex`.
- **Download the PDF built on GitHub:** open the **Actions** tab, click the latest run,
  and download **paper-pdf** under *Artifacts*.

## APA writing checklist

The template handles layout (title page, headings, spacing, references). These rules
depend on what you write, so check them yourself before submitting. The full list of
format rules is in [docs/apa7-student-format.md](docs/apa7-student-format.md).

- [ ] No "Introduction" heading; the paper title is repeated above the first paragraph.
- [ ] Abbreviations are spelled out the first time: student evaluation of teacher (SET).
- [ ] Numbers zero to nine are words, 10 and above are numerals. Always use numerals for
      percentages, ratios, dates, and scale values; always use words at the start of a
      sentence, title, or heading.
- [ ] Decimals have a leading zero only when the value can exceed 1 (0.34 *SD*, but
      *r* = .45 and *p* < .05).
- [ ] Direct quotations have a page number (p. 91) or range (pp. 8–9).
- [ ] Quotations of 40 words or more use `\begin{quote}` without quotation marks, with
      the citation after the final period.
- [ ] Scale anchors are italic (*strongly agree*); verbatim test items are in quotation
      marks.
- [ ] Every table and figure is mentioned in the text and has a title in title case.
- [ ] Every in-text citation has a reference entry, and every reference is cited.
- [ ] A source you found in another source is cited as
      `Seldin (1993, as cited in Pounder, 2007)`, and only the second source goes in
      `refs.bib`.
- [ ] Acronyms and proper nouns in `refs.bib` titles are wrapped in braces, such as `{DOI}`,
      so they keep their capitals.
- [ ] If your instructor asks for an abstract, uncomment `\abstract` and `\keywords` in
      `main.tex`.

## Links

- [`apa7` class on CTAN](https://ctan.org/pkg/apa7) (run `texdoc apa7` for the full manual)
- [`biblatex-apa` on CTAN](https://ctan.org/pkg/biblatex-apa)
- [APA Style website](https://apastyle.apa.org/)

## License

[MIT](LICENSE) for the template files. The `apa7` class and `biblatex-apa` have their own
licenses (LPPL).
