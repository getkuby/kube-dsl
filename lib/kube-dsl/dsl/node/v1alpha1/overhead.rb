# typed: strict

module KubeDSL
  module DSL
    module Node
      module V1alpha1
        class Overhead < ::KubeDSL::DSLObject
          key_value_field(:pod_fixed, format: :string)

          validates :pod_fixed, kv: { value_format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:podFixed] = pod_fixed.serialize
            end
          end

          def kind_sym
            :overhead
          end
        end
      end
    end
  end
end