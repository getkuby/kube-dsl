# typed: true

module KubeDSL
  module DSL
    module Flowcontrol
      module V1beta2
        class GroupSubject < ::KubeDSL::DSLObject
          value_field :name

          validates :name, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:name] = name
            end
          end

          def kind_sym
            :group_subject
          end
        end
      end
    end
  end
end