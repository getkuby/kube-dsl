module KubeDSL::DSL::V1
  class ComponentStatus < ::KubeDSL::DSLObject
    array_field(:condition) { KubeDSL::DSL::V1::ComponentCondition.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "v1"
        result[:kind] = "ComponentStatus"
        result[:conditions] = conditions.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :component_status
    end
  end
end
