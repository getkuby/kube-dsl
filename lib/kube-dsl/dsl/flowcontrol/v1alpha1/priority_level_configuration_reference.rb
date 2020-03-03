module KubeDSL::DSL::Flowcontrol::V1alpha1
  class PriorityLevelConfigurationReference < ::KubeDSL::DSLObject
    value_fields :name

    def serialize
      {}.tap do |result|
        result[:name] = name
      end
    end

    def kind
      :priority_level_configuration_reference
    end
  end
end
