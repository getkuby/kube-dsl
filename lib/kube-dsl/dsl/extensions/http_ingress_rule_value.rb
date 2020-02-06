module KubeDSL::DSL::Extensions
  class HTTPIngressRuleValue
    extend ::KubeDSL::ValueFields

    array_field(:path) { KubeDSL::DSL::Extensions::HTTPIngressPath.new }

    def serialize
      {}.tap do |result|
        result[:paths] = paths.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :http_ingress_rule_value
    end
  end
end
