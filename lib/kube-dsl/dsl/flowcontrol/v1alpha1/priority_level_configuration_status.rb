module KubeDSL::DSL::Flowcontrol::V1alpha1
  class PriorityLevelConfigurationStatus < ::KubeDSL::DSLObject
    array_field(:condition) { KubeDSL::DSL::Flowcontrol::V1alpha1::PriorityLevelConfigurationCondition.new }

    def serialize
      {}.tap do |result|
        result[:conditions] = conditions.map(&:serialize)
      end
    end

    def kind
      :priority_level_configuration_status
    end
  end
end
