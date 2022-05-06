# typed: strict

module KubeDSL
  module DSL
    module Node
      module V1beta1
        class RuntimeClass < ::KubeDSL::DSLObject
          value_field :handler
          object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
          object_field(:overhead) { KubeDSL::DSL::Node::V1beta1::Overhead.new }
          object_field(:scheduling) { KubeDSL::DSL::Node::V1beta1::Scheduling.new }

          validates :handler, field: { format: :string }, presence: false
          validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
          validates :overhead, object: { kind_of: KubeDSL::DSL::Node::V1beta1::Overhead }
          validates :scheduling, object: { kind_of: KubeDSL::DSL::Node::V1beta1::Scheduling }

          def serialize
            {}.tap do |result|
              result[:apiVersion] = "node.k8s.io/v1beta1"
              result[:handler] = handler
              result[:kind] = "RuntimeClass"
              result[:metadata] = metadata.serialize
              result[:overhead] = overhead.serialize
              result[:scheduling] = scheduling.serialize
            end
          end

          def kind_sym
            :runtime_class
          end
        end
      end
    end
  end
end