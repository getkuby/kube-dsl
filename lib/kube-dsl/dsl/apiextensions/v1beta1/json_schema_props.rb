module KubeDSL::DSL::Apiextensions::V1beta1
  class JSONSchemaProps < ::KubeDSL::DSLObject
    value_fields :$ref, :$schema, :additional_items, :additional_properties, :default, :description, :example, :exclusive_maximum, :exclusive_minimum, :format, :id, :items, :max_items, :max_length, :max_properties, :maximum, :min_items, :min_length, :min_properties, :minimum, :multiple_of, :nullable, :pattern, :title, :type, :unique_items, :x_kubernetes_embedded_resource, :x_kubernetes_int_or_string, :x_kubernetes_list_type, :x_kubernetes_map_type, :x_kubernetes_preserve_unknown_fields
    array_field(:all_of) { KubeDSL::DSL::Apiextensions::V1beta1::JSONSchemaProps.new }
    array_field(:any_of) { KubeDSL::DSL::Apiextensions::V1beta1::JSONSchemaProps.new }
    array_field(:enum) { KubeDSL::DSL::Apiextensions::V1beta1::JSON.new }
    array_field(:one_of) { KubeDSL::DSL::Apiextensions::V1beta1::JSONSchemaProps.new }
    array_field :required
    array_field :x_kubernetes_list_map_key
    object_field(:external_docs) { KubeDSL::DSL::Apiextensions::V1beta1::ExternalDocumentation.new }
    object_field(:not) { KubeDSL::DSL::Apiextensions::V1beta1::JSONSchemaProps.new }
    object_field(:definitions) { ::KubeDSL::KeyValueFields.new(format: :string) }
    object_field(:dependencies) { ::KubeDSL::KeyValueFields.new(format: :string) }
    object_field(:pattern_properties) { ::KubeDSL::KeyValueFields.new(format: :string) }
    object_field(:properties) { ::KubeDSL::KeyValueFields.new(format: :string) }

    def serialize
      {}.tap do |result|
        result[:$ref] = $ref
        result[:$schema] = $schema
        result[:additionalItems] = additional_items
        result[:additionalProperties] = additional_properties
        result[:default] = default
        result[:description] = description
        result[:example] = example
        result[:exclusiveMaximum] = exclusive_maximum
        result[:exclusiveMinimum] = exclusive_minimum
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
        result[:nullable] = nullable
        result[:pattern] = pattern
        result[:title] = title
        result[:type] = type
        result[:uniqueItems] = unique_items
        result[:'x-kubernetes-embedded-resource'] = x_kubernetes_embedded_resource
        result[:'x-kubernetes-int-or-string'] = x_kubernetes_int_or_string
        result[:'x-kubernetes-list-type'] = x_kubernetes_list_type
        result[:'x-kubernetes-map-type'] = x_kubernetes_map_type
        result[:'x-kubernetes-preserve-unknown-fields'] = x_kubernetes_preserve_unknown_fields
        result[:allOf] = all_oves.map(&:serialize)
        result[:anyOf] = any_oves.map(&:serialize)
        result[:enum] = ena.map(&:serialize)
        result[:oneOf] = one_oves.map(&:serialize)
        result[:required] = requireds
        result[:'x-kubernetes-list-map-keys'] = x_kubernetes_list_map_keys
        result[:externalDocs] = external_docs.serialize
        result[:not] = not.serialize
        result[:definitions] = definitions.serialize
        result[:dependencies] = dependencies.serialize
        result[:patternProperties] = pattern_properties.serialize
        result[:properties] = properties.serialize
      end
    end

    def kind_sym
      :json_schema_props
    end
  end
end
