module KubeDSL::DSL::Apps
  class DeploymentRollback
    extend ::KubeDSL::ValueFields
    value_fields :name
    object_field(:rollback_to) { KubeDSL::DSL::Apps::RollbackConfig.new }
    object_field(:updated_annotations) { ::KubeDSL::KeyValueFields.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "apps/v1beta1"
        result[:kind] = "DeploymentRollback"
        result[:name] = name
        result[:rollbackTo] = rollback_to.serialize
        result[:updatedAnnotations] = updated_annotations.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
