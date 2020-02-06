module KubeDSL::DSL::Networking
  class IngressSpec
    extend ::KubeDSL::ValueFields
    array_field(:rule) { KubeDSL::DSL::Networking::IngressRule.new }
    array_field(:tl) { KubeDSL::DSL::Networking::IngressTLS.new }
    object_field(:backend) { KubeDSL::DSL::Networking::IngressBackend.new }

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
  end
end
