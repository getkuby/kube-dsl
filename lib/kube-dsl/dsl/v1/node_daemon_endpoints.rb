# typed: true

module KubeDSL
  module DSL
    module V1
      class NodeDaemonEndpoints < ::KubeDSL::DSLObject
        object_field(:kubelet_endpoint) { KubeDSL::DSL::V1::DaemonEndpoint.new }

        validates :kubelet_endpoint, object: { kind_of: KubeDSL::DSL::V1::DaemonEndpoint }

        def serialize
          {}.tap do |result|
            result[:kubeletEndpoint] = kubelet_endpoint.serialize
          end
        end

        def kind_sym
          :node_daemon_endpoints
        end
      end
    end
  end
end