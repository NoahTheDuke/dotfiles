if !exists('g:polyglot_disabled') || index(g:polyglot_disabled, 'python') == -1

" Vim syntax file
"
" Based on python.vim (from Vim 6.1 distribution)
" by Neil Schemenauer <nas@python.ca>
"
" Notes Armin:
"
"     This version of the syntax file works better for 2.x and 3.x without
"     having to switch modes.
"
" Thanks:
"
"    Jeroen Ruigrok van der Werven
"        for the idea of highlighting for erroneous operators
"    Pedro Algarvio
"        for the patch to enable spell checking only for the right spots
"        (strings and comments)

"
" Options:
"
"    For set option do: let OPTION_NAME = 1
"    For clear option do: let OPTION_NAME = 0
"
" Option names:
"
"    For highlight builtin functions:
"       python_highlight_builtins
"
"    For highlight standard exceptions:
"       python_highlight_exceptions
"
"    For highlight string formatting:
"       python_highlight_string_formatting
"
"    For highlight indentation errors:
"       python_highlight_indent_errors
"
"    For highlight trailing spaces:
"       python_highlight_space_errors
"
"    For highlight doc-tests:
"       python_highlight_doctests
"
"    If you want all possible Python highlighting:
"    (This option not override previously set options)
"       python_highlight_all
"
"    For fast machines:
"       python_slow_sync
"

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

if exists("python_highlight_all") && python_highlight_all != 0
  " Not override previously set options
  if !exists("python_highlight_builtins")
    let python_highlight_builtins = 1
  endif
  if !exists("python_highlight_exceptions")
    let python_highlight_exceptions = 1
  endif
  if !exists("python_highlight_string_formatting")
    let python_highlight_string_formatting = 1
  endif
  if !exists("python_highlight_indent_errors")
    let python_highlight_indent_errors = 1
  endif
  if !exists("python_highlight_space_errors")
    let python_highlight_space_errors = 1
  endif
  if !exists("python_highlight_doctests")
    let python_highlight_doctests = 1
  endif
endif

" Keywords
syn keyword pythonBoolean       False True
syn keyword pythonConditional   if elif else
syn keyword pythonDefine        def class nextgroup=pythonFunction skipwhite
syn keyword pythonException     try except finally raise
syn keyword pythonImport        import from as
syn keyword pythonOperator      and in is not or
syn keyword pythonRepeat        for while
syn keyword pythonStatement     as assert async await
syn keyword pythonStatement     break continue del exec global lambda
syn keyword pythonStatement     nonlocal pass return with yield

" Decorators
syn match pythonDecorator   "@" display nextgroup=pythonFunction skipwhite

" Operator Symbols
syn match pythonOperator    "\v\+"
syn match pythonOperator    "\v/"
syn match pythonOperator    "\v\&"
syn match pythonOperator    "\v\^"
syn match pythonOperator    "\v\~"
syn match pythonOperator    "\v\|"
syn match pythonOperator    "\v\="
syn match pythonOperator    "\v\%"
syn match pythonOperator    "\v\*"
syn match pythonOperator    "\v\@"
syn match pythonOperator    "\v-"
syn match pythonOperator    "\v\="
syn match pythonOperator    "\v\<"
syn match pythonOperator    "\v\>"

syn region  Paren                   transparent start='(.\{-\}$' end=')'
syn match   pyCustomParen           "?=(" contains=Paren
syn match   pythonInlineFunction    "\w\+(\@=" contains=pyCustomParen

" The zero-length non-grouping match before the function name is
" extremely important in pythonFunction.  Without it, everything is
" interpreted as a function inside the contained environment of doctests.
" A dot must be allowed because of @MyClass.myfunc decorators.
syn match pythonFunction    "\%(\%(def\s\|class\s\|@\)\s*\)\@<=\h\%(\w\|\.\)*" contained

" Comments
syn match   pythonComment   "#.*$" display contains=pythonTodo,@Spell
syn match   pythonRun       "\%^#!.*$"
syn match   pythonCoding    "\%^.*\(\n.*\)\?#.*coding[:=]\s*[0-9A-Za-z-_.]\+.*$"
syn keyword pythonTodo      FIXME NOTE NOTES TODO XXX contained

" Errors
syn match pythonError   "\<\d\+\D\+\>" display
syn match pythonError   "[$?]" display
syn match pythonError   "[-+&|]\{2,}" display
syn match pythonError   "[=]\{3,}" display

" TODO: Mixing spaces and tabs also may be used for pretty formatting multiline
" statements. For now I don't know how to work around this.
if exists("python_highlight_indent_errors") && python_highlight_indent_errors != 0
  syn match pythonIndentError   "^\s*\( \t\|\t \)\s*\S"me=e-1 display
endif

" Trailing space errors
if exists("python_highlight_space_errors") && python_highlight_space_errors != 0
  " trailing whitespace
  syn match pythonSpaceError    "\s\+$" display
  " mixed tabs and spaces
  syn match pythonSpaceError    display " \+\t"
  syn match pythonSpaceError    display "\t\+ "
endif

" Strings
syn region pythonString start=+'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonEscape,pythonEscapeError,@Spell
syn region pythonString start=+"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonEscape,pythonEscapeError,@Spell
syn region pythonString start=+"""+ end=+"""+ keepend contains=pythonEscape,pythonEscapeError,pythonDocTest2,pythonSpaceError,@Spell
syn region pythonString start=+'''+ end=+'''+ keepend contains=pythonEscape,pythonEscapeError,pythonDocTest,pythonSpaceError,@Spell

syn match  pythonEscape         +\\[abfnrtv'"\\]+ display contained
syn match  pythonEscape         "\\\o\o\=\o\=" display contained
syn match  pythonEscapeError    "\\\o\{,2}[89]" display contained
syn match  pythonEscape         "\\x\x\{2}" display contained
syn match  pythonEscapeError    "\\x\x\=\X" display contained
syn match  pythonEscape         "\\$"

" Byte-Strings
syn region pythonBString    start=+[bB]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonBEscape,pythonBEscapeError,@Spell
syn region pythonBString    start=+[bB]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonBEscape,pythonBEscapeError,@Spell
syn region pythonBString    start=+[bB]"""+ end=+"""+ keepend contains=pythonBEscape,pythonBEscapeError,pythonDocTest2,pythonSpaceError,@Spell
syn region pythonBString    start=+[bB]'''+ end=+'''+ keepend contains=pythonBEscape,pythonBEscapeError,pythonDocTest,pythonSpaceError,@Spell

syn match  pythonBEscape        +\\[abfnrtv'"\\]+ display contained
syn match  pythonBEscape        "\\\o\o\=\o\=" display contained
syn match  pythonBEscapeError   "\\\o\{,2}[89]" display contained
syn match  pythonBEscape        "\\x\x\{2}" display contained
syn match  pythonBEscapeError   "\\x\x\=\X" display contained
syn match  pythonBEscape        "\\$"

" Unicode strings
syn region pythonUniString  start=+[uU]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonEscape,pythonUniEscape,pythonEscapeError,pythonUniEscapeError,@Spell
syn region pythonUniString  start=+[uU]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonEscape,pythonUniEscape,pythonEscapeError,pythonUniEscapeError,@Spell
syn region pythonUniString  start=+[uU]"""+ end=+"""+ keepend contains=pythonEscape,pythonUniEscape,pythonEscapeError,pythonUniEscapeError,pythonDocTest2,pythonSpaceError,@Spell
syn region pythonUniString  start=+[uU]'''+ end=+'''+ keepend contains=pythonEscape,pythonUniEscape,pythonEscapeError,pythonUniEscapeError,pythonDocTest,pythonSpaceError,@Spell

syn match  pythonUniEscape      "\\u\x\{4}" display contained
syn match  pythonUniEscapeError "\\u\x\{,3}\X" display contained
syn match  pythonUniEscape      "\\U\x\{8}" display contained
syn match  pythonUniEscapeError "\\U\x\{,7}\X" display contained
syn match  pythonUniEscape      "\\N{[A-Z ]\+}" display contained
syn match  pythonUniEscapeError "\\N{[^A-Z ]\+}" display contained

" Raw strings
syn region pythonRawString  start=+[rR]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonRawEscape,@Spell
syn region pythonRawString  start=+[rR]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonRawEscape,@Spell
syn region pythonRawString  start=+[rR]"""+ end=+"""+ keepend contains=pythonDocTest2,pythonSpaceError,@Spell
syn region pythonRawString  start=+[rR]'''+ end=+'''+ keepend contains=pythonDocTest,pythonSpaceError,@Spell

syn match pythonRawEscape   +\\['"]+ display transparent contained

" Unicode raw strings
syn region pythonUniRawString   start=+[uU][rR]'+ skip=+\\\\\|\\'\|\\$+ excludenl end=+'+ end=+$+ keepend contains=pythonRawEscape,pythonUniRawEscape,pythonUniRawEscapeError,@Spell
syn region pythonUniRawString   start=+[uU][rR]"+ skip=+\\\\\|\\"\|\\$+ excludenl end=+"+ end=+$+ keepend contains=pythonRawEscape,pythonUniRawEscape,pythonUniRawEscapeError,@Spell
syn region pythonUniRawString   start=+[uU][rR]"""+ end=+"""+ keepend contains=pythonUniRawEscape,pythonUniRawEscapeError,pythonDocTest2,pythonSpaceError,@Spell
syn region pythonUniRawString   start=+[uU][rR]'''+ end=+'''+ keepend contains=pythonUniRawEscape,pythonUniRawEscapeError,pythonDocTest,pythonSpaceError,@Spell

syn match pythonUniRawEscape        "\([^\\]\(\\\\\)*\)\@<=\\u\x\{4}" display contained
syn match pythonUniRawEscapeError   "\([^\\]\(\\\\\)*\)\@<=\\u\x\{,3}\X" display contained

if exists("python_highlight_string_formatting") && python_highlight_string_formatting != 0
  " String formatting
  syn match pythonStrFormat "%\(([^)]\+)\)\=[-#0 +]*\d*\(\.\d\+\)\=[hlL]\=[diouxXeEfFgGcrs%]" contained containedin=pythonString,pythonBString,pythonUniString,pythonRawString,pythonUniRawString
  syn match pythonStrFormat "%[-#0 +]*\(\*\|\d\+\)\=\(\.\(\*\|\d\+\)\)\=[hlL]\=[diouxXeEfFgGcrs%]" contained containedin=pythonString,pythonBString,pythonUniString,pythonRawString,pythonUniRawString
endif

if exists("python_highlight_doctests") && python_highlight_doctests != 0
  " DocTests
  syn region pythonDocTest  start="^\s*>>>" end=+'''+he=s-1 end="^\s*$" contained
  syn region pythonDocTest2 start="^\s*>>>" end=+"""+he=s-1 end="^\s*$" contained
endif

" Numbers (ints, longs, floats, complex)
syn match pythonHexNumber   "\<0[xX]\x\+[lL]\=\>" display
syn match pythonHexNumber   "\<0[xX]\>" display
syn match pythonNumber      "\<\d\+[lLjJ]\=\>" display
syn match pythonFloat       "\.\d\+\([eE][+-]\=\d\+\)\=[jJ]\=\>" display
syn match pythonFloat       "\<\d\+[eE][+-]\=\d\+[jJ]\=\>" display
syn match pythonFloat       "\<\d\+\.\d*\([eE][+-]\=\d\+\)\=[jJ]\=" display

syn match pythonOctalError  "\<0\o*[89]\d*[lL]\=\>" display
syn match pythonHexError    "\<0[xX]\X\+[lL]\=\>" display

if exists("python_highlight_builtins") && python_highlight_builtins != 0
  " Builtin functions, types and objects
  syn keyword pythonBuiltinConst  __debug__ Ellipsis None NotImplemented
  syn keyword pythonBuiltinConst  quit exit copywrite license credits

  syn keyword pythonBuiltinFunc __import__ abs all any
  syn keyword pythonBuiltinFunc ascii bin bool bytearray
  syn keyword pythonBuiltinFunc bytes callable chr classmethod
  syn keyword pythonBuiltinFunc compile complex delattr dict
  syn keyword pythonBuiltinFunc dir divmod enumerate eval
  syn keyword pythonBuiltinFunc exec filter float format
  syn keyword pythonBuiltinFunc frozenset getattr globals hasattr
  syn keyword pythonBuiltinFunc hash help hex id
  syn keyword pythonBuiltinFunc input int isinstance issubclass
  syn keyword pythonBuiltinFunc iter len list locals
  syn keyword pythonBuiltinFunc map max memoryview min
  syn keyword pythonBuiltinFunc next object oct open
  syn keyword pythonBuiltinFunc ord pow print property
  syn keyword pythonBuiltinFunc range repr reversed round
  syn keyword pythonBuiltinFunc set setattr slice sorted
  syn keyword pythonBuiltinFunc staticmethod str sum super
  syn keyword pythonBuiltinFunc tuple type vars zip
endif

if exists("python_highlight_exceptions") && python_highlight_exceptions != 0
  " Builtin exceptions and warnings
  syn keyword pythonExClass BaseException
  syn keyword pythonExClass Exception StandardError ArithmeticError
  syn keyword pythonExClass LookupError EnvironmentError

  syn keyword pythonExClass AssertionError AttributeError EOFError
  syn keyword pythonExClass FloatingPointError GeneratorExit IOError
  syn keyword pythonExClass ImportError IndexError KeyError
  syn keyword pythonExClass KeyboardInterrupt MemoryError NameError
  syn keyword pythonExClass NotImplementedError OSError OverflowError
  syn keyword pythonExClass ReferenceError RuntimeError StopIteration
  syn keyword pythonExClass SyntaxError IndentationError TabError
  syn keyword pythonExClass SystemError SystemExit TypeError
  syn keyword pythonExClass UnboundLocalError UnicodeError
  syn keyword pythonExClass UnicodeEncodeError UnicodeDecodeError
  syn keyword pythonExClass UnicodeTranslateError ValueError
  syn keyword pythonExClass WindowsError ZeroDivisionError

  syn keyword pythonExClass Warning UserWarning DeprecationWarning
  syn keyword pythonExClass PendingDepricationWarning SyntaxWarning
  syn keyword pythonExClass RuntimeWarning FutureWarning OverflowWarning
  syn keyword pythonExClass ImportWarning UnicodeWarning
endif

if exists("python_slow_sync") && python_slow_sync != 0
  syn sync minlines=2000
else
  " This is fast but code inside triple quoted strings screws it up. It
  " is impossible to fix because the only way to know if you are inside a
  " triple quoted string is to start from the beginning of the file.
  syn sync match pythonSync grouphere NONE "):$"
  syn sync maxlines=200
endif

if version >= 508 || !exists("did_python_syn_inits")
  if version <= 508
    let did_python_syn_inits = 1
    command -nargs=+ HiLink hi link <args>
  else
    command -nargs=+ HiLink hi def link <args>
  endif

  HiLink pythonBoolean          Boolean
  HiLink pythonCoding           Special
  HiLink pythonComment          Comment
  HiLink pythonConditional      Conditional
  HiLink pythonDecorator        Define
  HiLink pythonException        Exception
  HiLink pythonFunction         Function
  HiLink pythonImport           Include
  HiLink pythonOperator         Operator
  HiLink pythonRepeat           Repeat
  HiLink pythonRun              Special
  HiLink pythonStatement        Statement
  HiLink pythonTodo             Todo

  HiLink pythonDefine           Define
  HiLink pythonInlineFunction   Function

  HiLink pythonError        Error
  HiLink pythonIndentError  Error
  HiLink pythongpaceError   Error

  HiLink pythonString       String
  HiLink pythonBString      String
  HiLink pythonUniString    String
  HiLink pythonRawString    String
  HiLink pythonUniRawString String

  HiLink pythonEscape               Special
  HiLink pythonBEscape              Special
  HiLink pythonEscapeError          Error
  HiLink pythonBEscapeError         Error
  HiLink pythonUniEscape            Special
  HiLink pythonUniEscapeError       Error
  HiLink pythonUniRawEscape         Special
  HiLink pythonUniRawEscapeError    Error

  HiLink pythonStrFormat    Special

  HiLink pythonDocTest      Special
  HiLink pythonDocTest2     Special

  HiLink pythonNumber       Number
  HiLink pythonHexNumber    Number
  HiLink pythonFloat        Float
  HiLink pythonOctalError   Error
  HiLink pythonHexError     Error

  HiLink pythonBuiltinConst Structure
  HiLink pythonBuiltinFunc  Identifier

  HiLink pythonExClass  Structure

  delcommand HiLink
endif

let b:current_syntax = "python"

endif