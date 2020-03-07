module KubeDSL::DSL::Flowcontrol::V1alpha1
  class PriorityLevelConfigurationList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Flowcontrol::V1alpha1::PriorityLevelConfiguration.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "flowcontrol.apiserver.k8s.io/v1alpha1"
        result[:kind] = "PriorityLevelConfigurationList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :priority_level_configuration_list
    end
  end
end
