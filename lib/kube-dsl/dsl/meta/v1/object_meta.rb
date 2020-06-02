module KubeDSL::DSL::Meta::V1
  class ObjectMeta < ::KubeDSL::DSLObject
    value_fields :cluster_name, :creation_timestamp, :deletion_grace_period_seconds, :deletion_timestamp, :finalizers, :generate_name, :generation, :name, :namespace, :resource_version, :self_link, :uid
    array_field(:managed_field) { KubeDSL::DSL::Meta::V1::ManagedFieldsEntry.new }
    array_field(:owner_reference) { KubeDSL::DSL::Meta::V1::OwnerReference.new }
    object_field(:annotations) { ::KubeDSL::KeyValueFields.new(format: :string) }
    object_field(:labels) { ::KubeDSL::KeyValueFields.new(format: :string) }

    def serialize
      {}.tap do |result|
        result[:clusterName] = cluster_name
        result[:creationTimestamp] = creation_timestamp
        result[:deletionGracePeriodSeconds] = deletion_grace_period_seconds
        result[:deletionTimestamp] = deletion_timestamp
        result[:finalizers] = finalizers
        result[:generateName] = generate_name
        result[:generation] = generation
        result[:name] = name
        result[:namespace] = namespace
        result[:resourceVersion] = resource_version
        result[:selfLink] = self_link
        result[:uid] = uid
        result[:managedFields] = managed_fields.map(&:serialize)
        result[:ownerReferences] = owner_references.map(&:serialize)
        result[:annotations] = annotations.serialize
        result[:labels] = labels.serialize
      end
    end

    def kind_sym
      :object_meta
    end
  end
end
