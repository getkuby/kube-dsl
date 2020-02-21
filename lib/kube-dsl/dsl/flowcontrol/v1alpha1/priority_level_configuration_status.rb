module KubeDSL::DSL::Flowcontrol::V1alpha1
  class PriorityLevelConfigurationStatus
    extend ::KubeDSL::ValueFields

    array_field(:condition) { KubeDSL::DSL::Flowcontrol::V1alpha1::PriorityLevelConfigurationCondition.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:conditions] = conditions.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :priority_level_configuration_status
    end
  end
end
