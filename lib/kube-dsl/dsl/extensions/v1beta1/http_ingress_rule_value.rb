module KubeDSL::DSL::Extensions::V1beta1
  class HTTPIngressRuleValue
    extend ::KubeDSL::ValueFields

    array_field(:path) { KubeDSL::DSL::Extensions::V1beta1::HTTPIngressPath.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

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
