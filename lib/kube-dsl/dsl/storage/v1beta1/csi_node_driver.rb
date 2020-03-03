module KubeDSL::DSL::Storage::V1beta1
  class CSINodeDriver < ::KubeDSL::DSLObject
    value_fields :name, :node_id
    array_field :topology_key
    object_field(:allocatable) { KubeDSL::DSL::Storage::V1beta1::VolumeNodeResources.new }

    def serialize
      {}.tap do |result|
        result[:name] = name
        result[:nodeID] = node_id
        result[:topologyKeys] = topology_keys
        result[:allocatable] = allocatable.serialize
      end
    end

    def kind
      :csi_node_driver
    end
  end
end
