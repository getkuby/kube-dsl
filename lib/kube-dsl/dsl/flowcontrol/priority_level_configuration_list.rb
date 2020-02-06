module KubeDSL::DSL::Flowcontrol
  class PriorityLevelConfigurationList
    extend ::KubeDSL::ValueFields

    array_field(:item) { KubeDSL::DSL::Flowcontrol::PriorityLevelConfiguration.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "flowcontrol.apiserver.k8s.io/v1alpha1"
        result[:kind] = "PriorityLevelConfigurationList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :priority_level_configuration_list
    end
  end
end
