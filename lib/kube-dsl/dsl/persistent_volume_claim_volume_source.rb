module KubeDSL::DSL
  class PersistentVolumeClaimVolumeSource
    extend ::KubeDSL::ValueFields
    value_fields :claim_name, :read_only

    def serialize
      {}.tap do |result|
        result[:claimName] = claim_name
        result[:readOnly] = read_only
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
