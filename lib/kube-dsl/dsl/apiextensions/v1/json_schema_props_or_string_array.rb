module KubeDSL::DSL::Apiextensions::V1
  class JSONSchemaPropsOrStringArray
    extend ::KubeDSL::ValueFields


    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :json_schema_props_or_string_array
    end
  end
end
