module KubeDSL::DSL::Flowcontrol::V1alpha1
  class PriorityLevelConfigurationSpec
    extend ::KubeDSL::ValueFields

    value_fields :type
    object_field(:limited) { KubeDSL::DSL::Flowcontrol::V1alpha1::LimitedPriorityLevelConfiguration.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:type] = type
        result[:limited] = limited.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :priority_level_configuration_spec
    end
  end
end
