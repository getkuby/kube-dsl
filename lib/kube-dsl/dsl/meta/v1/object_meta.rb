# typed: strict

module KubeDSL
  module DSL
    module Meta
      module V1
        class ObjectMeta < ::KubeDSL::DSLObject
          key_value_field(:annotations, format: :string)
          value_field :cluster_name
          value_field :creation_timestamp
          value_field :deletion_grace_period_seconds
          value_field :deletion_timestamp
          value_field :finalizers
          value_field :generate_name
          value_field :generation
          key_value_field(:labels, format: :string)
          array_field(:managed_field) { KubeDSL::DSL::Meta::V1::ManagedFieldsEntry.new }
          value_field :name
          value_field :namespace
          array_field(:owner_reference) { KubeDSL::DSL::Meta::V1::OwnerReference.new }
          value_field :resource_version
          value_field :self_link
          value_field :uid

          validates :annotations, kv: { value_format: :string }, presence: false
          validates :cluster_name, field: { format: :string }, presence: false
          validates :creation_timestamp, field: { format: :string }, presence: false
          validates :deletion_grace_period_seconds, field: { format: :integer }, presence: false
          validates :deletion_timestamp, field: { format: :string }, presence: false
          validates :finalizers, field: { format: :string }, presence: false
          validates :generate_name, field: { format: :string }, presence: false
          validates :generation, field: { format: :integer }, presence: false
          validates :labels, kv: { value_format: :string }, presence: false
          validates :managed_fields, array: { kind_of: KubeDSL::DSL::Meta::V1::ManagedFieldsEntry }, presence: false
          validates :name, field: { format: :string }, presence: false
          validates :namespace, field: { format: :string }, presence: false
          validates :owner_references, array: { kind_of: KubeDSL::DSL::Meta::V1::OwnerReference }, presence: false
          validates :resource_version, field: { format: :string }, presence: false
          validates :self_link, field: { format: :string }, presence: false
          validates :uid, field: { format: :string }, presence: false

          def serialize
            {}.tap do |result|
              result[:annotations] = annotations.serialize
              result[:clusterName] = cluster_name
              result[:creationTimestamp] = creation_timestamp
              result[:deletionGracePeriodSeconds] = deletion_grace_period_seconds
              result[:deletionTimestamp] = deletion_timestamp
              result[:finalizers] = finalizers
              result[:generateName] = generate_name
              result[:generation] = generation
              result[:labels] = labels.serialize
              result[:managedFields] = managed_fields.map(&:serialize)
              result[:name] = name
              result[:namespace] = namespace
              result[:ownerReferences] = owner_references.map(&:serialize)
              result[:resourceVersion] = resource_version
              result[:selfLink] = self_link
              result[:uid] = uid
            end
          end

          def kind_sym
            :object_meta
          end
        end
      end
    end
  end
end