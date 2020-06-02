module KubeDSL::DSL::Apiextensions::V1beta1
  class CustomResourceDefinitionNames < ::KubeDSL::DSLObject
    value_fields :categories, :kind, :list_kind, :plural, :short_names, :singular

    def serialize
      {}.tap do |result|
        result[:categories] = categories
        result[:kind] = kind
        result[:listKind] = list_kind
        result[:plural] = plural
        result[:shortNames] = short_names
        result[:singular] = singular
      end
    end

    def kind_sym
      :custom_resource_definition_names
    end
  end
end
