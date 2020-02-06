module KubeDSL::DSL::Apiextensions
  class ExternalDocumentation
    extend ::KubeDSL::ValueFields

    value_fields :description, :url

    def serialize
      {}.tap do |result|
        result[:description] = description
        result[:url] = url
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :external_documentation
    end
  end
end
