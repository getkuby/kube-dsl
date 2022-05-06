# typed: strict

module KubeDSL
  module DSL
    module Meta
      module V1
        class WatchEvent < ::KubeDSL::DSLObject
          value_field :object
          value_field :type

          validates :object, field: { format: :string }, presence: false
          validates :type, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:object] = object
              result[:type] = type
            end
          end

          def kind_sym
            :watch_event
          end
        end
      end
    end
  end
end