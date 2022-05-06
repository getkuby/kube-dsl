# typed: strict

module KubeDSL
  module DSL
    module V1
      class ComponentStatus < ::KubeDSL::DSLObject
        array_field(:condition) { KubeDSL::DSL::V1::ComponentCondition.new }
        object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }

        validates :conditions, array: { kind_of: KubeDSL::DSL::V1::ComponentCondition }, presence: false
        validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }

        def serialize
          {}.tap do |result|
            result[:apiVersion] = "v1"
            result[:conditions] = conditions.map(&:serialize)
            result[:kind] = "ComponentStatus"
            result[:metadata] = metadata.serialize
          end
        end

        def kind_sym
          :component_status
        end
      end
    end
  end
end