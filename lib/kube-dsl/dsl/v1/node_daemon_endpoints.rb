module KubeDSL::DSL::V1
  class NodeDaemonEndpoints
    extend ::KubeDSL::ValueFields

    object_field(:kubelet_endpoint) { KubeDSL::DSL::V1::DaemonEndpoint.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:kubeletEndpoint] = kubelet_endpoint.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :node_daemon_endpoints
    end
  end
end
