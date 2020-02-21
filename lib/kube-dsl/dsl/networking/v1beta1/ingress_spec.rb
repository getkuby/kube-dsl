module KubeDSL::DSL::Networking::V1beta1
  class IngressSpec
    extend ::KubeDSL::ValueFields

    array_field(:rule) { KubeDSL::DSL::Networking::V1beta1::IngressRule.new }
    array_field(:tl) { KubeDSL::DSL::Networking::V1beta1::IngressTLS.new }
    object_field(:backend) { KubeDSL::DSL::Networking::V1beta1::IngressBackend.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:rules] = rules.map(&:serialize)
        result[:tls] = tls.map(&:serialize)
        result[:backend] = backend.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :ingress_spec
    end
  end
end
