module KubeDSL::DSL::Authorization
  class NonResourceRule
    extend ::KubeDSL::ValueFields

    array_field :non_resource_url
    array_field :verb

    def serialize
      {}.tap do |result|
        result[:nonResourceURLs] = non_resource_urls
        result[:verbs] = verbs
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :non_resource_rule
    end
  end
end
