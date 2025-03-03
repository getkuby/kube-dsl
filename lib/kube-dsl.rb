# typed: true
module KubeDSL
  KUBERNETES_VERSION = '1.23.17'.freeze

  autoload :AllowBlank,           'kube-dsl/allow_blank'
  autoload :ArrayFieldRes,        'kube-dsl/array_field_res'
  autoload :Builder,              'kube-dsl/builder'
  autoload :DefaultFieldRes,      'kube-dsl/default_field_res'
  autoload :DSL,                  'kube-dsl/dsl'
  autoload :DSLObject,            'kube-dsl/dsl_object'
  autoload :Entrypoint,           'kube-dsl/entrypoint'
  autoload :EntrypointBuilder,    'kube-dsl/entrypoint_builder'
  autoload :ExternalRef,          'kube-dsl/external_ref'
  autoload :ExternalResourceMeta, 'kube-dsl/external_resource_meta'
  autoload :FieldRes,             'kube-dsl/field_res'
  autoload :Generator,            'kube-dsl/generator'
  autoload :Inflector,            'kube-dsl/inflector'
  autoload :InlineRef,            'kube-dsl/inline_ref'
  autoload :KeyValueFields,       'kube-dsl/key_value_fields'
  autoload :KeyValueFieldRes,     'kube-dsl/key_value_field_res'
  autoload :ObjectFieldRes,       'kube-dsl/object_field_res'
  autoload :RbiHelpers,           'kube-dsl/rbi_helpers'
  autoload :Ref,                  'kube-dsl/ref'
  autoload :Resource,             'kube-dsl/resource'
  autoload :ResourceMeta,         'kube-dsl/resource_meta'
  autoload :SerializeHandler,     'kube-dsl/serialize_handler'
  autoload :StringHelpers,        'kube-dsl/string_helpers'
  autoload :Validations,          'kube-dsl/validations'
  autoload :ValueFields,          'kube-dsl/value_fields'

  extend Entrypoint
end
