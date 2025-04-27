(comment) @comment

["{" "}" "[" "]" "(" ")"] @punctuation.bracket

";" @punctuation.delimiter

(entry_command
    . "ENTRY" @function.builtin
    name: (symbol) @constant)

(sections_command
    . "SECTIONS" @keyword)

(output_section
    name: (symbol) @label
    )
(output_section
    . "/DISCARD/" @keyword)

(section_type
    ["NOLOAD" "DSECT" "COPY" "INFO" "OVERLAY"] @keyword)?
(load_memory_address
    . "AT" @function.builtin)?

(input_section
    . [(filename) (symbol)] @variable.special)
(input_section
    section: [(filename) (symbol)] @constant)

(wildcard_pattern
    . "*" @punctuation.special)

(overlay_command
    "OVERLAY" @keyword
    "NOCROSSREFS" @keyword)

(_ . "AT" @function.builtin)
(keep_command . "KEEP" @function.builtin)
(provide_command
    . ["PROVIDE" "PROVIDE_HIDDEN"] @function.builtin
    (symbol) @variable)

(memory_command
    . "MEMORY" @keyword
    name: (symbol) @label
    (attributes)* @attribute
    ["ORIGIN" "org" "o" "LENGTH" "len" "l"] @keyword)

(assignment
    . (symbol) @variable
    "=" @punctuation)

(binary_expression operator: (_) @operator)

(call_expression
    function: [
        ((symbol) @function)
        ((symbol) @preproc
          (#any-eq? @preproc
            "DEFINED"))
        ((symbol) @function.builtin
          (#any-eq? @function.builtin
            "ALIGN"))])

(number) @constant

(expression "." @variable.special)

(region . ">" @punctuation.special)
(lma_region . "AT" @keyword ">" @punctuation.special)
(phdr . ":" @punctuation.special (symbol) @variable.special)
(fillexp . "=" @punctuation)
