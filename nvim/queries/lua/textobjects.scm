;; extends
(function_declaration name: (identifier) @function.name)
(function_call name: (identifier) @call.inner)
(table_constructor (field) @table.field)
(table_constructor (field name: _ @table.key))
(table_constructor (field value: _ @table.value))
