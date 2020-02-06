module KubeDSL
  autoload :DSL,            'kube-dsl/dsl'
  autoload :Entrypoint,     'kube-dsl/entrypoint'
  autoload :Generator,      'kube-dsl/generator'
  autoload :Inflector,      'kube-dsl/inflector'
  autoload :KeyValueFields, 'kube-dsl/key_value_fields'
  autoload :Ref,            'kube-dsl/ref'
  autoload :Resource,       'kube-dsl/resource'
  autoload :ResourceMeta,   'kube-dsl/resource_meta'
  autoload :StringHelpers,  'kube-dsl/string_helpers'
  autoload :ValueFields,    'kube-dsl/value_fields'

  extend Entrypoint
end
