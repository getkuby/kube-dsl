module KubeDSL::DSL::V1
  class ComponentStatus
    extend ::KubeDSL::ValueFields

    array_field(:condition) { KubeDSL::DSL::V1::ComponentCondition.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

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

    def kind
      :component_status
    end
  end
end
