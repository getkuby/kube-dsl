# typed: true

module KubeDSL
  module DSL
    module Rbac
      module V1alpha1
        class RoleBindingList < ::KubeDSL::DSLObject
          array_field(:item) { KubeDSL::DSL::Rbac::V1alpha1::RoleBinding.new }
          object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

          validates :items, array: { kind_of: KubeDSL::DSL::Rbac::V1alpha1::RoleBinding }, presence: false
          validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ListMeta }

          def serialize
            {}.tap do |result|
              result[:apiVersion] = "rbac.authorization.k8s.io/v1alpha1"
              result[:items] = items.map(&:serialize)
              result[:kind] = "RoleBindingList"
              result[:metadata] = metadata.serialize
            end
          end

          def kind_sym
            :role_binding_list
          end
        end
      end
    end
  end
end