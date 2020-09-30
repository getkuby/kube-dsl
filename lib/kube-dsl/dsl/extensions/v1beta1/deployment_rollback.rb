module KubeDSL::DSL::Extensions::V1beta1
  class DeploymentRollback < ::KubeDSL::DSLObject
    value_field :name
    object_field(:rollback_to) { KubeDSL::DSL::Extensions::V1beta1::RollbackConfig.new }
    key_value_field(:updated_annotations, format: :string)

    validates :name, field: { format: :string }, presence: false
    validates :rollback_to, object: { kind_of: KubeDSL::DSL::Extensions::V1beta1::RollbackConfig }
    validates :updated_annotations, kv: { value_format: :string }, presence: false

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
