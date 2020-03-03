module KubeDSL::DSL::Apiextensions::V1
  class ExternalDocumentation < ::KubeDSL::DSLObject
    value_fields :description, :url

    def serialize
      {}.tap do |result|
        result[:description] = description
        result[:url] = url
      end
    end

    def kind
      :external_documentation
    end
  end
end
