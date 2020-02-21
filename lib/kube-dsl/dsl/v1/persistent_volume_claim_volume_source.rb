module KubeDSL::DSL::V1
  class PersistentVolumeClaimVolumeSource
    extend ::KubeDSL::ValueFields

    value_fields :claim_name, :read_only

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:claimName] = claim_name
        result[:readOnly] = read_only
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :persistent_volume_claim_volume_source
    end
  end
end
