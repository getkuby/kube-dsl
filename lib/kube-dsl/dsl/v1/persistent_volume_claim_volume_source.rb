module KubeDSL::DSL::V1
  class PersistentVolumeClaimVolumeSource < ::KubeDSL::DSLObject
    value_fields :claim_name, :read_only

    def serialize
      {}.tap do |result|
        result[:claimName] = claim_name
        result[:readOnly] = read_only
      end
    end

    def kind_sym
      :persistent_volume_claim_volume_source
    end
  end
end
