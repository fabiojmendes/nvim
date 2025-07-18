;extends

(macro_invocation
  (scoped_identifier
    path: (identifier) @_path (#eq? @_path "sqlx")
    name: (identifier) @_name (#match? @_name "^query"))
  (token_tree
    (raw_string_literal
      (string_content) @injection.content
      (#set! injection.language "sql")))
)
