module KubeDSL::DSL::V1
  class PersistentVolumeClaimStatus < ::KubeDSL::DSLObject
    value_fields :access_modes, :phase
    array_field(:condition) { KubeDSL::DSL::V1::PersistentVolumeClaimCondition.new }
    object_field(:capacity) { ::KubeDSL::KeyValueFields.new(format: :string) }

    def serialize
      {}.tap do |result|
        result[:accessModes] = access_modes
        result[:phase] = phase
        result[:conditions] = conditions.map(&:serialize)
        result[:capacity] = capacity.serialize
      end
    end

    def kind_sym
      :persistent_volume_claim_status
    end
  end
end
