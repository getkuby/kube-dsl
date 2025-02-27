# typed: true

module KubeDSL
  module DSL
    module V1
      class PersistentVolumeClaimStatus < ::KubeDSL::DSLObject
        value_field :access_modes
        key_value_field(:allocated_resources, format: :string)
        key_value_field(:capacity, format: :string)
        array_field(:condition) { KubeDSL::DSL::V1::PersistentVolumeClaimCondition.new }
        value_field :phase
        value_field :resize_status

        validates :access_modes, field: { format: :string }, presence: false
        validates :allocated_resources, kv: { value_format: :string }, presence: false
        validates :capacity, kv: { value_format: :string }, presence: false
        validates :conditions, array: { kind_of: KubeDSL::DSL::V1::PersistentVolumeClaimCondition }, presence: false
        validates :phase, field: { format: :string }, presence: false
        validates :resize_status, field: { format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:accessModes] = access_modes
            result[:allocatedResources] = allocated_resources.serialize
            result[:capacity] = capacity.serialize
            result[:conditions] = conditions.map(&:serialize)
            result[:phase] = phase
            result[:resizeStatus] = resize_status
          end
        end

        def kind_sym
          :persistent_volume_claim_status
        end
      end
    end
  end
end