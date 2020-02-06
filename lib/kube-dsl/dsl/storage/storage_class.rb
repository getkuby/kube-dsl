module KubeDSL::DSL::Storage
  class StorageClass
    extend ::KubeDSL::ValueFields
    value_fields :allow_volume_expansion, :provisioner, :reclaim_policy, :volume_binding_mode
    array_field(:allowed_topology) { KubeDSL::DSL::TopologySelectorTerm.new }
    array_field :mount_option
    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }
    object_field(:parameters) { ::KubeDSL::KeyValueFields.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "storage.k8s.io/v1beta1"
        result[:kind] = "StorageClass"
        result[:allowVolumeExpansion] = allow_volume_expansion
        result[:provisioner] = provisioner
        result[:reclaimPolicy] = reclaim_policy
        result[:volumeBindingMode] = volume_binding_mode
        result[:allowedTopologies] = allowed_topologies.map(&:serialize)
        result[:mountOptions] = mount_options
        result[:metadata] = metadata.serialize
        result[:parameters] = parameters.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
