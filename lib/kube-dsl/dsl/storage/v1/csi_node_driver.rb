# typed: true

module KubeDSL::DSL::Storage::V1
  class CSINodeDriver < ::KubeDSL::DSLObject
    object_field(:allocatable) { KubeDSL::DSL::Storage::V1::VolumeNodeResources.new }
    value_field :name
    value_field :node_id
    value_field :topology_keys

    validates :allocatable, object: { kind_of: KubeDSL::DSL::Storage::V1::VolumeNodeResources }
    validates :name, field: { format: :string }, presence: false
    validates :node_id, field: { format: :string }, presence: false
    validates :topology_keys, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:allocatable] = allocatable.serialize
        result[:name] = name
        result[:nodeID] = node_id
        result[:topologyKeys] = topology_keys
      end
    end

    def kind_sym
      :csi_node_driver
    end
  end
end
