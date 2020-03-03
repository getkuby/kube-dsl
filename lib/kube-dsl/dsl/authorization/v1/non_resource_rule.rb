module KubeDSL::DSL::Authorization::V1
  class NonResourceRule < ::KubeDSL::DSLObject
    array_field :non_resource_url
    array_field :verb

    def serialize
      {}.tap do |result|
        result[:nonResourceURLs] = non_resource_urls
        result[:verbs] = verbs
      end
    end

    def kind
      :non_resource_rule
    end
  end
end
