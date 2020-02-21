module KubeDSL::DSL::Apiextensions::V1
  class CustomResourceColumnDefinition
    extend ::KubeDSL::ValueFields

    value_fields :description, :format, :json_path, :name, :priority, :type

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:description] = description
        result[:format] = format
        result[:jsonPath] = json_path
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
