;; extends
; ((operator) @operator (#eq? @operator "==")(#set! conceal "≡"))
((operator) @operator (#eq? @operator "/=") (#set! conceal "≠"))
; ((operator) @operator (#eq? @operator "<=") (#set! conceal "≤"))
; ((operator) @operator (#eq? @operator ">=") (#set! conceal "≥"))
; ((operator) @operator (#eq? @operator ">>") (#set! conceal "»"))
; ((operator) @operator (#eq? @operator "<<") (#set! conceal "«"))
; ((operator) @operator (#eq? @operator "++") (#set! conceal "⧺"))
; ((operator) @operator (#eq? @operator "!!") (#set! conceal "‼"))
((operator) @operator (#eq? @operator ".") (#set! conceal "∘"))
; ((operator) @operator (#eq? @operator "..") (#set! conceal "‥"))

; ("->" @operator (#set! conceal "→"))
; ("<-" @operator (#set! conceal "←"))
; ("=>" @operator (#set! conceal "⇒"))
; ("::" @operator (#set! conceal "∷"))
("\\" @operator (#set! conceal "λ"))
