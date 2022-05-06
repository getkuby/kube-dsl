# typed: strict

module KubeDSL
  module DSL
    module Node
      module V1beta1
        class RuntimeClassList < ::KubeDSL::DSLObject
          array_field(:item) { KubeDSL::DSL::Node::V1beta1::RuntimeClass.new }
          object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

          validates :items, array: { kind_of: KubeDSL::DSL::Node::V1beta1::RuntimeClass }, presence: false
          validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ListMeta }

          def serialize
            {}.tap do |result|
              result[:apiVersion] = "node.k8s.io/v1beta1"
              result[:items] = items.map(&:serialize)
              result[:kind] = "RuntimeClassList"
              result[:metadata] = metadata.serialize
            end
          end

          def kind_sym
            :runtime_class_list
          end
        end
      end
    end
  end
end