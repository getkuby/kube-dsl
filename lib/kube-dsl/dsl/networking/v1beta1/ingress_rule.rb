module KubeDSL::DSL::Networking::V1beta1
  class IngressRule < ::KubeDSL::DSLObject
    value_fields :host
    object_field(:http) { KubeDSL::DSL::Networking::V1beta1::HTTPIngressRuleValue.new }

    def serialize
      {}.tap do |result|
        result[:host] = host
        result[:http] = http.serialize
      end
    end

    def kind_sym
      :ingress_rule
    end
  end
end
