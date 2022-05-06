# typed: true

module KubeDSL
  module DSL
    module Apiserverinternal
      module V1alpha1
        class StorageVersion < ::KubeDSL::DSLObject
          object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
          value_field :spec
          object_field(:status) { KubeDSL::DSL::Apiserverinternal::V1alpha1::StorageVersionStatus.new }

          validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
          validates :spec, field: { format: :string }, presence: false
          validates :status, object: { kind_of: KubeDSL::DSL::Apiserverinternal::V1alpha1::StorageVersionStatus }

          def serialize
            {}.tap do |result|
              result[:apiVersion] = "internal.apiserver.k8s.io/v1alpha1"
              result[:kind] = "StorageVersion"
              result[:metadata] = metadata.serialize
              result[:spec] = spec
              result[:status] = status.serialize
            end
          end

          def kind_sym
            :storage_version
          end
        end
      end
    end
  end
end