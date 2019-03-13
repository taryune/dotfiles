$latex         = 'platex -synctex=1 %O %S';
$bibtex        = 'pbibtex %O %B';
$dvipdf = 'dvipdfmx -f ptex-ipa.map %O -o %D %S';
if ($^O eq 'darwin') {
    $pdf_previewer = 'open -a Preview %S';
} elsif ($^O eq 'linux') {
    $pdf_previewer = 'evince';
}
$pdf_mode = 3;
