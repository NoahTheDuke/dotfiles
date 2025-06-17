; extends

(identifier)

(expression_statement
  (action
    (identifier) @function.call))

(integer) @number
(float) @number

((identifier) @bool
  (#any-of? @bool "true" "false")) @boolean

(operator) @keyword.operator

(comment) @comment @spell

(capture
  (identifier) @keyword)
