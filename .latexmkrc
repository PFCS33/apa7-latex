# Build with XeLaTeX so the paper can use system fonts (Times New Roman).
# latexmk runs biber automatically when needed.
$pdf_mode = 5;

# Put auxiliary files (.aux, .log, .bcf, ...) in build/ and keep main.pdf
# next to main.tex so it is easy to find.
$aux_dir = 'build';
