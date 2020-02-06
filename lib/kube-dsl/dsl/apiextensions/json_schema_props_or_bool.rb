module KubeDSL::DSL::Apiextensions
  class JSONSchemaPropsOrBool
    extend ::KubeDSL::ValueFields


    def serialize
      {}.tap do |result|
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :json_schema_props_or_bool
    end
  end
end
