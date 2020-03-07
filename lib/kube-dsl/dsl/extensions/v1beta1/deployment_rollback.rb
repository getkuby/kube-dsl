module KubeDSL::DSL::Extensions::V1beta1
  class DeploymentRollback < ::KubeDSL::DSLObject
    value_fields :name
    object_field(:rollback_to) { KubeDSL::DSL::Extensions::V1beta1::RollbackConfig.new }
    object_field(:updated_annotations) { ::KubeDSL::KeyValueFields.new(format: :string) }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "extensions/v1beta1"
        result[:kind] = "DeploymentRollback"
        result[:name] = name
        result[:rollbackTo] = rollback_to.serialize
        result[:updatedAnnotations] = updated_annotations.serialize
      end
    end

    def kind_sym
      :deployment_rollback
    end
  end
end
