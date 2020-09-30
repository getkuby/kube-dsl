module KubeDSL::DSL::V1
  class PersistentVolumeClaimVolumeSource < ::KubeDSL::DSLObject
    value_field :claim_name
    value_field :read_only

    validates :claim_name, field: { format: :string }, presence: false
    validates :read_only, field: { format: :boolean }, presence: false

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
