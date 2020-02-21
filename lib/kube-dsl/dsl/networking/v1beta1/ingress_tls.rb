module KubeDSL::DSL::Networking::V1beta1
  class IngressTLS
    extend ::KubeDSL::ValueFields

    value_fields :secret_name
    array_field :host

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:secretName] = secret_name
        result[:hosts] = hosts
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :ingress_tls
    end
  end
end
