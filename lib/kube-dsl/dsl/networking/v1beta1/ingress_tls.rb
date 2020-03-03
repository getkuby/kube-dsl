module KubeDSL::DSL::Networking::V1beta1
  class IngressTLS < ::KubeDSL::DSLObject
    value_fields :secret_name
    array_field :host

    def serialize
      {}.tap do |result|
        result[:secretName] = secret_name
        result[:hosts] = hosts
      end
    end

    def kind
      :ingress_tls
    end
  end
end
