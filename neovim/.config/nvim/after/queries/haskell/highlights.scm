; Better highlighting of namespaces and import decls
(qualified_module (module) @none)
(qualified_type (module) @namespace)
(qualified_variable (module) @namespace)
(import (module) @namespace)

; Module is keyword not namespace
"module" @keyword

; Function names in the signature and decl should be highlighted, but not
; applied functions
(function
  name: (variable) @function
  patterns: (patterns))
(function
  name: (variable) @function
  rhs: (exp_infix))
(function
  name: (variable) @function
  rhs: (exp_literal))
(exp_apply . (exp_name (variable) @none))
(exp_apply . (exp_name (qualified_variable (variable) @none)))
