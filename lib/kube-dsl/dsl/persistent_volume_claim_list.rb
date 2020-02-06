module KubeDSL::DSL
  class PersistentVolumeClaimList
    extend ::KubeDSL::ValueFields
    array_field(:item) { KubeDSL::DSL::PersistentVolumeClaim.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "PersistentVolumeClaimList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
