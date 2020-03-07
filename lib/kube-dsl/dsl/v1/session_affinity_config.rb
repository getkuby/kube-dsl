module KubeDSL::DSL::V1
  class SessionAffinityConfig < ::KubeDSL::DSLObject
    object_field(:client_ip) { KubeDSL::DSL::V1::ClientIPConfig.new }

    def serialize
      {}.tap do |result|
        result[:clientIP] = client_ip.serialize
      end
    end

    def kind_sym
      :session_affinity_config
    end
  end
end
