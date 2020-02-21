module KubeDSL::DSL::Apiextensions::V1beta1
  class CustomResourceColumnDefinition
    extend ::KubeDSL::ValueFields

    value_fields :json_path, :description, :format, :name, :priority, :type

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:JSONPath] = json_path
        result[:description] = description
        result[:format] = format
        result[:name] = name
        result[:priority] = priority
        result[:type] = type
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :custom_resource_column_definition
    end
  end
end
