module KubeDSL::DSL::Storage::V1
  class CSINodeDriver
    extend ::KubeDSL::ValueFields

    value_fields :name, :node_id
    array_field :topology_key
    object_field(:allocatable) { KubeDSL::DSL::Storage::V1::VolumeNodeResources.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:nodeID] = node_id
        result[:topologyKeys] = topology_keys
        result[:allocatable] = allocatable.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :csi_node_driver
    end
  end
end
