module KubeDSL::DSL::Apiextensions
  class CustomResourceColumnDefinition
    extend ::KubeDSL::ValueFields
    value_fields :json_path, :description, :format, :name, :priority, :type

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
  end
end
