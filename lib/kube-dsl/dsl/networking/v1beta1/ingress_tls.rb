module KubeDSL::DSL::Networking::V1beta1
  class IngressTLS < ::KubeDSL::DSLObject
    value_fields :hosts, :secret_name

    def serialize
      {}.tap do |result|
        result[:hosts] = hosts
        result[:secretName] = secret_name
      end
    end

    def kind_sym
      :ingress_tls
    end
  end
end
