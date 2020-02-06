module KubeDSL::DSL::Apiextensions
  class CustomResourceDefinitionNames
    extend ::KubeDSL::ValueFields

    value_fields :kind, :list_kind, :plural, :singular
    array_field :category
    array_field :short_name

    def serialize
      {}.tap do |result|
        result[:kind] = kind
        result[:listKind] = list_kind
        result[:plural] = plural
        result[:singular] = singular
        result[:categories] = categories
        result[:shortNames] = short_names
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :custom_resource_definition_names
    end
  end
end
