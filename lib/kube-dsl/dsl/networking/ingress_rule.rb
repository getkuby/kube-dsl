module KubeDSL::DSL::Networking
  class IngressRule
    extend ::KubeDSL::ValueFields

    value_fields :host
    object_field(:http) { KubeDSL::DSL::Networking::HTTPIngressRuleValue.new }

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
