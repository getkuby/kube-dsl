# typed: true

module KubeDSL
  module DSL
    module Authorization
      module V1
        class NonResourceRule < ::KubeDSL::DSLObject
          value_field :non_resource_ur_ls
          value_field :verbs

          validates :non_resource_ur_ls, field: { format: :string }, presence: false
          validates :verbs, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:nonResourceURLs] = non_resource_ur_ls
              result[:verbs] = verbs
            end
          end

          def kind_sym
            :non_resource_rule
          end
        end
      end
    end
  end
end