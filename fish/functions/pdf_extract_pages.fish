function pdf_extract_pages
    set --local PDF_FILE    $argv[1]
    set --local FIRST_PAGE  $argv[2]
    set --local LAST_PAGE   $argv[3]

    pdfseparate -f $FIRST_PAGE -l $LAST_PAGE $PDF_FILE extracted-page-%d.pdf
end

