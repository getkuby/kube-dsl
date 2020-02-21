module KubeDSL::DSL::Authorization::V1beta1
  class NonResourceRule
    extend ::KubeDSL::ValueFields

    array_field :non_resource_url
    array_field :verb

    def initialize(&block)
      instance_eval(&block) if block
    end

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
