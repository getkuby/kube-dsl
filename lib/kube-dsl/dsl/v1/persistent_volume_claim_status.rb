module KubeDSL::DSL::V1
  class PersistentVolumeClaimStatus
    extend ::KubeDSL::ValueFields

    value_fields :phase
    array_field :access_mode
    array_field(:condition) { KubeDSL::DSL::V1::PersistentVolumeClaimCondition.new }
    object_field(:capacity) { ::KubeDSL::KeyValueFields.new(format: :string) }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:phase] = phase
        result[:accessModes] = access_modes
        result[:conditions] = conditions.map(&:serialize)
        result[:capacity] = capacity.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :persistent_volume_claim_status
    end
  end
end
