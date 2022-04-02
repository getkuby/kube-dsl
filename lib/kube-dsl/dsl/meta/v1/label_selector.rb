# typed: true

module KubeDSL
  module DSL
    module Meta
      module V1
        class LabelSelector < ::KubeDSL::DSLObject
          array_field(:match_expression) { KubeDSL::DSL::Meta::V1::LabelSelectorRequirement.new }
          key_value_field(:match_labels, format: :string)

          validates :match_expressions, array: { kind_of: KubeDSL::DSL::Meta::V1::LabelSelectorRequirement }, presence: false
          validates :match_labels, kv: { value_format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:matchExpressions] = match_expressions.map(&:serialize)
              result[:matchLabels] = match_labels.serialize
            end
          end

          def kind_sym
            :label_selector
          end
        end
      end
    end
  end
end