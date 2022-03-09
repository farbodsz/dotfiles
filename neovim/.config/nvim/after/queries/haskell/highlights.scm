; Module is keyword not namespace. Module name no highlighting.
"module" @keyword
(module) @none

; Better highlighting of namespaces and import decls
(qualified_module (module) @none)
(qualified_type (module) @namespace)
(qualified_variable (module) @namespace)
(import (module) @none)
(import 
  (qualified_module) 
  (module) @namespace)

; Function names in the signature and decl should be highlighted, but not
; applied functions
(function
  name: (variable) @function)
(exp_apply . (exp_name (variable) @none))
(exp_apply . (exp_name (qualified_variable (variable) @none)))

(type_variable) @field
