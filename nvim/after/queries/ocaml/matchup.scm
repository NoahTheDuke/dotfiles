(if_expression
  "if" @open.if
  (then_clause
    "then" @mid.if.1)
  (else_clause
    "else" @mid.if.2)?) @scope.if

(parenthesized_expression
  "begin" @open.begin
  "end" @close.begin) @scope.begin

(module_definition
  (module_binding
    (structure
      "struct" @open.class
      "end" @close.class))) @scope.class

(for_expression
  "for" @open.loop
  ("to")? @mid.loop.1
  ("downto")? @mid.loop.1
  (do_clause
  "do" @mid.loop.2
    "done" @close.loop)) @scope.loop

(while_expression
  "while" @open.loop
  (do_clause
  "do" @mid.loop.2
    "done" @close.loop)) @scope.loop

(match_expression
  "match" @open.case
  "with" @mid.case.1
  (match_case
    pattern: (_) @mid.case.2
    body: (_))) @scope.case

(let_expression
  (value_definition
    "let" @open.let)
  "in" @mid.let.1) @scope.let
