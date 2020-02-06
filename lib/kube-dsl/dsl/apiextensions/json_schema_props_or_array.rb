module KubeDSL::DSL::Apiextensions
  class JSONSchemaPropsOrArray
    extend ::KubeDSL::ValueFields


    def serialize
      {}.tap do |result|
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :json_schema_props_or_array
    end
  end
end
