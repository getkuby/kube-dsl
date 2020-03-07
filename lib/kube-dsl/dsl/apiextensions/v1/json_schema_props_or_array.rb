module KubeDSL::DSL::Apiextensions::V1
  class JSONSchemaPropsOrArray < ::KubeDSL::DSLObject

    def serialize
      {}.tap do |result|
      end
    end

    def kind_sym
      :json_schema_props_or_array
    end
  end
end
