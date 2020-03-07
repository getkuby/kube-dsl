module KubeDSL::DSL::Flowcontrol::V1alpha1
  class PriorityLevelConfigurationSpec < ::KubeDSL::DSLObject
    value_fields :type
    object_field(:limited) { KubeDSL::DSL::Flowcontrol::V1alpha1::LimitedPriorityLevelConfiguration.new }

    def serialize
      {}.tap do |result|
        result[:type] = type
        result[:limited] = limited.serialize
      end
    end

    def kind_sym
      :priority_level_configuration_spec
    end
  end
end
