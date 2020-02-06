module KubeDSL::DSL::Flowcontrol
  class PriorityLevelConfigurationSpec
    extend ::KubeDSL::ValueFields
    value_fields :type
    object_field(:limited) { KubeDSL::DSL::Flowcontrol::LimitedPriorityLevelConfiguration.new }

    def serialize
      {}.tap do |result|
        result[:type] = type
        result[:limited] = limited.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
