module KubeDSL::DSL
  class ComponentStatus
    extend ::KubeDSL::ValueFields
    array_field(:condition) { KubeDSL::DSL::ComponentCondition.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "ComponentStatus"
        result[:conditions] = conditions.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
