module KubeDSL::DSL::Flowcontrol
  class PriorityLevelConfigurationReference
    extend ::KubeDSL::ValueFields

    value_fields :name

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
