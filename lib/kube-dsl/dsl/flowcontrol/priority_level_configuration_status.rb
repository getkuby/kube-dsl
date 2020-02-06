module KubeDSL::DSL::Flowcontrol
  class PriorityLevelConfigurationStatus
    extend ::KubeDSL::ValueFields
    array_field(:condition) { KubeDSL::DSL::Flowcontrol::PriorityLevelConfigurationCondition.new }

    def serialize
      {}.tap do |result|
        result[:conditions] = conditions.map(&:serialize)
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
