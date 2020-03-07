module KubeDSL::DSL::Apiextensions::V1
  class JSONSchemaPropsOrBool < ::KubeDSL::DSLObject

    def serialize
      {}.tap do |result|
      end
    end

    def kind_sym
      :json_schema_props_or_bool
    end
  end
end
