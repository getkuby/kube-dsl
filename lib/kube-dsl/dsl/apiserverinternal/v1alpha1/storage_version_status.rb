# typed: true

module KubeDSL
  module DSL
    module Apiserverinternal
      module V1alpha1
        class StorageVersionStatus < ::KubeDSL::DSLObject
          value_field :common_encoding_version
          array_field(:condition) { KubeDSL::DSL::Apiserverinternal::V1alpha1::StorageVersionCondition.new }
          array_field(:storage_version) { KubeDSL::DSL::Apiserverinternal::V1alpha1::ServerStorageVersion.new }

          validates :common_encoding_version, field: { format: :string }, presence: false
          validates :conditions, array: { kind_of: KubeDSL::DSL::Apiserverinternal::V1alpha1::StorageVersionCondition }, presence: false
          validates :storage_versions, array: { kind_of: KubeDSL::DSL::Apiserverinternal::V1alpha1::ServerStorageVersion }, presence: false

          def serialize
            {}.tap do |result|
              result[:commonEncodingVersion] = common_encoding_version
              result[:conditions] = conditions.map(&:serialize)
              result[:storageVersions] = storage_versions.map(&:serialize)
            end
          end

          def kind_sym
            :storage_version_status
          end
        end
      end
    end
  end
end