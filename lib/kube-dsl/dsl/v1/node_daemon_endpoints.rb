module KubeDSL::DSL::V1
  class NodeDaemonEndpoints < ::KubeDSL::DSLObject
    object_field(:kubelet_endpoint) { KubeDSL::DSL::V1::DaemonEndpoint.new }

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
