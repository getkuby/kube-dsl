# typed: true

module KubeDSL::DSL::Extensions::V1beta1
  class IngressSpec < ::KubeDSL::DSLObject
    object_field(:backend) { KubeDSL::DSL::Extensions::V1beta1::IngressBackend.new }
    array_field(:rule) { KubeDSL::DSL::Extensions::V1beta1::IngressRule.new }
    array_field(:tls) { KubeDSL::DSL::Extensions::V1beta1::IngressTLS.new }

    validates :backend, object: { kind_of: KubeDSL::DSL::Extensions::V1beta1::IngressBackend }
    validates :rules, array: { kind_of: KubeDSL::DSL::Extensions::V1beta1::IngressRule }, presence: false
    validates :tlses, array: { kind_of: KubeDSL::DSL::Extensions::V1beta1::IngressTLS }, presence: false

    def serialize
      {}.tap do |result|
        result[:backend] = backend.serialize
        result[:rules] = rules.map(&:serialize)
        result[:tls] = tlses.map(&:serialize)
      end
    end

    def kind_sym
      :ingress_spec
    end
  end
end
