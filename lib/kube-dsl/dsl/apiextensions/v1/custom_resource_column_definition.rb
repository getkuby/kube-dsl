module KubeDSL::DSL::Apiextensions::V1
  class CustomResourceColumnDefinition < ::KubeDSL::DSLObject
    value_fields :description, :format, :json_path, :name, :priority, :type

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

    def kind
      :custom_resource_column_definition
    end
  end
end
