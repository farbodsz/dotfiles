(fenced_code_block
  (info_string
    (language) @_name
    (#eq? @_name "hs"))
  (code_fence_content) @haskell)

(fenced_code_block
  (info_string
    (language) @_name
    (#eq? @_name "js"))
  (code_fence_content) @javascript)

(fenced_code_block
  (info_string
    (language) @_name
    (#any-of? @_name "sh" "shell"))
  (code_fence_content) @bash)

(fenced_code_block
  (info_string
    (language) @_name
    (#eq? @_name "ts"))
  (code_fence_content) @typescript)
