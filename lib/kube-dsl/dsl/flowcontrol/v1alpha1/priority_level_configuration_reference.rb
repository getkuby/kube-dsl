module KubeDSL::DSL::Flowcontrol::V1alpha1
  class PriorityLevelConfigurationReference
    extend ::KubeDSL::ValueFields

    value_fields :name

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:name] = name
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :priority_level_configuration_reference
    end
  end
end
