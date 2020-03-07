module KubeDSL::DSL::Extensions::V1beta1
  class IngressSpec < ::KubeDSL::DSLObject
    array_field(:rule) { KubeDSL::DSL::Extensions::V1beta1::IngressRule.new }
    array_field(:tls) { KubeDSL::DSL::Extensions::V1beta1::IngressTLS.new }
    object_field(:backend) { KubeDSL::DSL::Extensions::V1beta1::IngressBackend.new }

    def serialize
      {}.tap do |result|
        result[:rules] = rules.map(&:serialize)
        result[:tls] = tlses.map(&:serialize)
        result[:backend] = backend.serialize
      end
    end

    def kind_sym
      :ingress_spec
    end
  end
end
