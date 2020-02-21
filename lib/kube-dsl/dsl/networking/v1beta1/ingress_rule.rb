module KubeDSL::DSL::Networking::V1beta1
  class IngressRule
    extend ::KubeDSL::ValueFields

    value_fields :host
    object_field(:http) { KubeDSL::DSL::Networking::V1beta1::HTTPIngressRuleValue.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:host] = host
        result[:http] = http.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :ingress_rule
    end
  end
end
