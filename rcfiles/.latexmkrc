#!/usr/bin/env perl

# latexmk -gg -pdfdvi hoge.tex # use uplatex
# latexmk -gg -pdfps hoge.tex  # use uplatex
# latexmk -gg -pdf hoge.tex    # use pdflatex

$latex = 'uplatex %O -synctex=1 -interaction=nonstopmode %S';
# $pdflatex = 'lualatex %O -synctex=1 -interaction=nonstopmode %S';
$pdflatex = 'xelatex %O -synctex=1 -interaction=nonstopmode %S';
$biber = 'biber %O --bblencoding=utf8 -u -U --output_safechars %B';
$bibtex = 'upbibtex %O %B';
$makeindex = 'upmendex %O -o %D %S';
$dvipdf = 'dvipdfmx %O -o %D %S';
$dvips = 'dvips %O -z -f %S | convbkmk -u > %D';
$ps2pdf = 'ps2pdf %O %S %D';
$pdf_mode = 3;

if ($^O eq 'darwin') {
    $pvc_view_file_via_temporary = 0;
    $pdf_previewer = 'open';
} else {
    $pdf_previewer = 'xdg-open';
}
