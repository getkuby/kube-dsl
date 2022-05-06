# typed: strict

module KubeDSL
  module DSL
    module Storage
      module V1beta1
        class CSIStorageCapacity < ::KubeDSL::DSLObject
          value_field :capacity
          value_field :maximum_volume_size
          object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
          object_field(:node_topology) { KubeDSL::DSL::Meta::V1::LabelSelector.new }
          value_field :storage_class_name

          validates :capacity, field: { format: :string }, presence: false
          validates :maximum_volume_size, field: { format: :string }, presence: false
          validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
          validates :node_topology, object: { kind_of: KubeDSL::DSL::Meta::V1::LabelSelector }
          validates :storage_class_name, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:apiVersion] = "storage.k8s.io/v1beta1"
              result[:capacity] = capacity
              result[:kind] = "CSIStorageCapacity"
              result[:maximumVolumeSize] = maximum_volume_size
              result[:metadata] = metadata.serialize
              result[:nodeTopology] = node_topology.serialize
              result[:storageClassName] = storage_class_name
            end
          end

          def kind_sym
            :csi_storage_capacity
          end
        end
      end
    end
  end
end