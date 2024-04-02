;; extends
attribute: (_) @attribute.inner
function: (_) @attribute.outer
(type) @type.inner
return_type: (type) @return_type.inner
(return_statement) @return
(function_definition name: (identifier) @function.name)
(dictionary (pair) @table.field)
(dictionary (pair key: _ @table.key))
(dictionary (pair value: _ @table.value))
