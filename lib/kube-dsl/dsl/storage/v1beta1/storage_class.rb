module KubeDSL::DSL::Storage::V1beta1
  class StorageClass < ::KubeDSL::DSLObject
    value_field :allow_volume_expansion
    array_field(:allowed_topology) { KubeDSL::DSL::V1::TopologySelectorTerm.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    value_field :mount_options
    key_value_field(:parameters, format: :string)
    value_field :provisioner
    value_field :reclaim_policy
    value_field :volume_binding_mode

    validates :allow_volume_expansion, field: { format: :boolean }, presence: false
    validates :allowed_topologies, array: { kind_of: KubeDSL::DSL::V1::TopologySelectorTerm }, presence: false
    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
    validates :mount_options, field: { format: :string }, presence: false
    validates :parameters, kv: { value_format: :string }, presence: false
    validates :provisioner, field: { format: :string }, presence: false
    validates :reclaim_policy, field: { format: :string }, presence: false
    validates :volume_binding_mode, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:allowVolumeExpansion] = allow_volume_expansion
        result[:allowedTopologies] = allowed_topologies.map(&:serialize)
        result[:apiVersion] = "storage.k8s.io/v1beta1"
        result[:kind] = "StorageClass"
        result[:metadata] = metadata.serialize
        result[:mountOptions] = mount_options
        result[:parameters] = parameters.serialize
        result[:provisioner] = provisioner
        result[:reclaimPolicy] = reclaim_policy
        result[:volumeBindingMode] = volume_binding_mode
      end
    end

    def kind_sym
      :storage_class
    end
  end
end
