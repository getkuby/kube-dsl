# typed: true

module KubeDSL
  module DSL
    module Node
      module V1alpha1
        class RuntimeClassSpec < ::KubeDSL::DSLObject
          object_field(:overhead) { KubeDSL::DSL::Node::V1alpha1::Overhead.new }
          value_field :runtime_handler
          object_field(:scheduling) { KubeDSL::DSL::Node::V1alpha1::Scheduling.new }

          validates :overhead, object: { kind_of: KubeDSL::DSL::Node::V1alpha1::Overhead }
          validates :runtime_handler, field: { format: :string }, presence: false
          validates :scheduling, object: { kind_of: KubeDSL::DSL::Node::V1alpha1::Scheduling }

          def serialize
            {}.tap do |result|
              result[:overhead] = overhead.serialize
              result[:runtimeHandler] = runtime_handler
              result[:scheduling] = scheduling.serialize
            end
          end

          def kind_sym
            :runtime_class_spec
          end
        end
      end
    end
  end
end