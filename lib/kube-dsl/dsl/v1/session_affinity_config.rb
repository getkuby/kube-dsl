# typed: true

module KubeDSL
  module DSL
    module V1
      class SessionAffinityConfig < ::KubeDSL::DSLObject
        object_field(:client_ip) { KubeDSL::DSL::V1::ClientIPConfig.new }

        validates :client_ip, object: { kind_of: KubeDSL::DSL::V1::ClientIPConfig }

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
  end
end