(quasiquote 
 ((quoter) @language)
 ((quasiquote_body) @content)
)

(quasiquote 
 (quoter) @_name
 (#eq? @_name "hsx")
 ((quasiquote_body) @content)
 (#set! language "html")
)
