module KubeDSL::DSL::Auditregistration::V1alpha1
  class Policy < ::KubeDSL::DSLObject
    value_fields :level
    array_field :stage

    def serialize
      {}.tap do |result|
        result[:level] = level
        result[:stages] = stages
      end
    end

    def kind
      :policy
    end
  end
end
