# typed: true

module KubeDSL::DSL::Apiextensions::V1
  class JSONSchemaProps < ::KubeDSL::DSLObject
    value_field :additional_items
    value_field :additional_properties
    array_field(:all_ofs) { KubeDSL::DSL::Apiextensions::V1::JSONSchemaProps.new }
    array_field(:any_ofs) { KubeDSL::DSL::Apiextensions::V1::JSONSchemaProps.new }
    value_field :default
    key_value_field(:definitions, format: :string)
    key_value_field(:dependencies, format: :string)
    value_field :description
    array_field(:enums) { KubeDSL::DSL::Apiextensions::V1::JSON.new }
    value_field :example
    value_field :exclusive_maximum
    value_field :exclusive_minimum
    object_field(:external_docs) { KubeDSL::DSL::Apiextensions::V1::ExternalDocumentation.new }
    value_field :format
    value_field :id
    value_field :items
    value_field :max_items
    value_field :max_length
    value_field :max_properties
    value_field :maximum
    value_field :min_items
    value_field :min_length
    value_field :min_properties
    value_field :minimum
    value_field :multiple_of
    object_field(:not_field) { KubeDSL::DSL::Apiextensions::V1::JSONSchemaProps.new }
    value_field :nullable
    array_field(:one_ofs) { KubeDSL::DSL::Apiextensions::V1::JSONSchemaProps.new }
    value_field :pattern
    key_value_field(:pattern_properties, format: :string)
    key_value_field(:properties, format: :string)
    value_field :required
    value_field :title
    value_field :type
    value_field :unique_items
    value_field :x_kubernetes_embedded_resource
    value_field :x_kubernetes_int_or_string
    value_field :x_kubernetes_list_map_keys
    value_field :x_kubernetes_list_type
    value_field :x_kubernetes_map_type
    value_field :x_kubernetes_preserve_unknown_fields

    validates :additional_items, field: { format: :string }, presence: false
    validates :additional_properties, field: { format: :string }, presence: false
    validates :all_ofs, array: { kind_of: KubeDSL::DSL::Apiextensions::V1::JSONSchemaProps }, presence: false
    validates :any_ofs, array: { kind_of: KubeDSL::DSL::Apiextensions::V1::JSONSchemaProps }, presence: false
    validates :default, field: { format: :string }, presence: false
    validates :definitions, kv: { value_format: :string }, presence: false
    validates :dependencies, kv: { value_format: :string }, presence: false
    validates :description, field: { format: :string }, presence: false
    validates :enums, array: { kind_of: KubeDSL::DSL::Apiextensions::V1::JSON }, presence: false
    validates :example, field: { format: :string }, presence: false
    validates :exclusive_maximum, field: { format: :boolean }, presence: false
    validates :exclusive_minimum, field: { format: :boolean }, presence: false
    validates :external_docs, object: { kind_of: KubeDSL::DSL::Apiextensions::V1::ExternalDocumentation }
    validates :format, field: { format: :string }, presence: false
    validates :id, field: { format: :string }, presence: false
    validates :items, field: { format: :string }, presence: false
    validates :max_items, field: { format: :integer }, presence: false
    validates :max_length, field: { format: :integer }, presence: false
    validates :max_properties, field: { format: :integer }, presence: false
    validates :maximum, field: { format: :number }, presence: false
    validates :min_items, field: { format: :integer }, presence: false
    validates :min_length, field: { format: :integer }, presence: false
    validates :min_properties, field: { format: :integer }, presence: false
    validates :minimum, field: { format: :number }, presence: false
    validates :multiple_of, field: { format: :number }, presence: false
    validates :not_field, object: { kind_of: KubeDSL::DSL::Apiextensions::V1::JSONSchemaProps }
    validates :nullable, field: { format: :boolean }, presence: false
    validates :one_ofs, array: { kind_of: KubeDSL::DSL::Apiextensions::V1::JSONSchemaProps }, presence: false
    validates :pattern, field: { format: :string }, presence: false
    validates :pattern_properties, kv: { value_format: :string }, presence: false
    validates :properties, kv: { value_format: :string }, presence: false
    validates :required, field: { format: :string }, presence: false
    validates :title, field: { format: :string }, presence: false
    validates :type, field: { format: :string }, presence: false
    validates :unique_items, field: { format: :boolean }, presence: false
    validates :x_kubernetes_embedded_resource, field: { format: :boolean }, presence: false
    validates :x_kubernetes_int_or_string, field: { format: :boolean }, presence: false
    validates :x_kubernetes_list_map_keys, field: { format: :string }, presence: false
    validates :x_kubernetes_list_type, field: { format: :string }, presence: false
    validates :x_kubernetes_map_type, field: { format: :string }, presence: false
    validates :x_kubernetes_preserve_unknown_fields, field: { format: :boolean }, presence: false

    def serialize
      {}.tap do |result|
        result[:additionalItems] = additional_items
        result[:additionalProperties] = additional_properties
        result[:allOf] = all_ofs.map(&:serialize)
        result[:anyOf] = any_ofs.map(&:serialize)
        result[:default] = default
        result[:definitions] = definitions.serialize
        result[:dependencies] = dependencies.serialize
        result[:description] = description
        result[:enum] = enums.map(&:serialize)
        result[:example] = example
        result[:exclusiveMaximum] = exclusive_maximum
        result[:exclusiveMinimum] = exclusive_minimum
        result[:externalDocs] = external_docs.serialize
        result[:format] = format
        result[:id] = id
        result[:items] = items
        result[:maxItems] = max_items
        result[:maxLength] = max_length
        result[:maxProperties] = max_properties
        result[:maximum] = maximum
        result[:minItems] = min_items
        result[:minLength] = min_length
        result[:minProperties] = min_properties
        result[:minimum] = minimum
        result[:multipleOf] = multiple_of
        result[:not] = not_field.serialize
        result[:nullable] = nullable
        result[:oneOf] = one_ofs.map(&:serialize)
        result[:pattern] = pattern
        result[:patternProperties] = pattern_properties.serialize
        result[:properties] = properties.serialize
        result[:required] = required
        result[:title] = title
        result[:type] = type
        result[:uniqueItems] = unique_items
        result[:'x-kubernetes-embedded-resource'] = x_kubernetes_embedded_resource
        result[:'x-kubernetes-int-or-string'] = x_kubernetes_int_or_string
        result[:'x-kubernetes-list-map-keys'] = x_kubernetes_list_map_keys
        result[:'x-kubernetes-list-type'] = x_kubernetes_list_type
        result[:'x-kubernetes-map-type'] = x_kubernetes_map_type
        result[:'x-kubernetes-preserve-unknown-fields'] = x_kubernetes_preserve_unknown_fields
      end
    end

    def kind_sym
      :json_schema_props
    end
  end
end
