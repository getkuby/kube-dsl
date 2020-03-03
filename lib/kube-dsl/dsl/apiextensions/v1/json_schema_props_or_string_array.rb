module KubeDSL::DSL::Apiextensions::V1
  class JSONSchemaPropsOrStringArray < ::KubeDSL::DSLObject

    def serialize
      {}.tap do |result|
      end
    end

    def kind
      :json_schema_props_or_string_array
    end
  end
end
