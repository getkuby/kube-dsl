module KubeDSL::DSL::Flowcontrol::V1alpha1
  class PriorityLevelConfigurationReference < ::KubeDSL::DSLObject
    value_field :name

    validates :name, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:name] = name
      end
    end

    def kind_sym
      :priority_level_configuration_reference
    end
  end
end
