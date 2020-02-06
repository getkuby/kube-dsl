module KubeDSL::DSL
  class NodeDaemonEndpoints
    extend ::KubeDSL::ValueFields
    object_field(:kubelet_endpoint) { KubeDSL::DSL::DaemonEndpoint.new }

    def serialize
      {}.tap do |result|
        result[:kubeletEndpoint] = kubelet_endpoint.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
