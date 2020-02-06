module KubeDSL::DSL
  class PersistentVolumeClaim
    extend ::KubeDSL::ValueFields

    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::PersistentVolumeClaimSpec.new }
    object_field(:status) { KubeDSL::DSL::PersistentVolumeClaimStatus.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "PersistentVolumeClaim"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :persistent_volume_claim
    end
  end
end
