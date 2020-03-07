module KubeDSL::DSL::V1
  class PersistentVolume < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::V1::PersistentVolumeSpec.new }
    object_field(:status) { KubeDSL::DSL::V1::PersistentVolumeStatus.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "PersistentVolume"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
        result[:status] = status.serialize
      end
    end

    def kind_sym
      :persistent_volume
    end
  end
end
