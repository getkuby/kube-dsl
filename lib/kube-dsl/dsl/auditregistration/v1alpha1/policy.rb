module KubeDSL::DSL::Auditregistration::V1alpha1
  class Policy < ::KubeDSL::DSLObject
    value_fields :level, :stages

    def serialize
      {}.tap do |result|
        result[:level] = level
        result[:stages] = stages
      end
    end

    def kind_sym
      :policy
    end
  end
end
