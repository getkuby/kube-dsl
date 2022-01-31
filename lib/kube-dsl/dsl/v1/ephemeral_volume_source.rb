# typed: true

module KubeDSL::DSL::V1
  class EphemeralVolumeSource < ::KubeDSL::DSLObject
    object_field(:volume_claim_template) { KubeDSL::DSL::V1::PersistentVolumeClaimTemplate.new }

    validates :volume_claim_template, object: { kind_of: KubeDSL::DSL::V1::PersistentVolumeClaimTemplate }

    def serialize
      {}.tap do |result|
        result[:volumeClaimTemplate] = volume_claim_template.serialize
      end
    end

    def kind_sym
      :ephemeral_volume_source
    end
  end
end
