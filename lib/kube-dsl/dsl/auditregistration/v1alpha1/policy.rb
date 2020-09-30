module KubeDSL::DSL::Auditregistration::V1alpha1
  class Policy < ::KubeDSL::DSLObject
    value_field :level
    value_field :stages

    validates :level, field: { format: :string }, presence: false
    validates :stages, field: { format: :string }, presence: false

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
