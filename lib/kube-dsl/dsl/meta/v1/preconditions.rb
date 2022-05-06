# typed: true

module KubeDSL
  module DSL
    module Meta
      module V1
        class Preconditions < ::KubeDSL::DSLObject
          value_field :resource_version
          value_field :uid

          validates :resource_version, field: { format: :string }, presence: false
          validates :uid, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:resourceVersion] = resource_version
              result[:uid] = uid
            end
          end

          def kind_sym
            :preconditions
          end
        end
      end
    end
  end
end