function pdf_extract_pages
    pdftk $argv[1] cat $argv[2] output extracted.pdf
end

