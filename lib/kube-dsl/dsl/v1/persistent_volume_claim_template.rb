module KubeDSL::DSL::V1
  class PersistentVolumeClaimTemplate < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::V1::PersistentVolumeClaimSpec.new }

    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
    validates :spec, object: { kind_of: KubeDSL::DSL::V1::PersistentVolumeClaimSpec }

    def serialize
      {}.tap do |result|
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
      end
    end

    def kind_sym
      :persistent_volume_claim_template
    end
  end
end
