module KubeDSL::DSL::Storage::V1beta1
  class StorageClass < ::KubeDSL::DSLObject
    value_fields :allow_volume_expansion, :mount_options, :provisioner, :reclaim_policy, :volume_binding_mode
    array_field(:allowed_topology) { KubeDSL::DSL::V1::TopologySelectorTerm.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    key_value_field(:parameters, format: :string)

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "storage.k8s.io/v1beta1"
        result[:kind] = "StorageClass"
        result[:allowVolumeExpansion] = allow_volume_expansion
        result[:mountOptions] = mount_options
        result[:provisioner] = provisioner
        result[:reclaimPolicy] = reclaim_policy
        result[:volumeBindingMode] = volume_binding_mode
        result[:allowedTopologies] = allowed_topologies.map(&:serialize)
        result[:metadata] = metadata.serialize
        result[:parameters] = parameters.serialize
      end
    end

    def kind_sym
      :storage_class
    end
  end
end
