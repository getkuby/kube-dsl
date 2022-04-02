# typed: true

module KubeDSL
  module DSL
    module V1
      class PersistentVolumeStatus < ::KubeDSL::DSLObject
        value_field :message
        value_field :phase
        value_field :reason

        validates :message, field: { format: :string }, presence: false
        validates :phase, field: { format: :string }, presence: false
        validates :reason, field: { format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:message] = message
            result[:phase] = phase
            result[:reason] = reason
          end
        end

        def kind_sym
          :persistent_volume_status
        end
      end
    end
  end
end