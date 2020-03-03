module KubeDSL::DSL::V1
  class NodeSpec < ::KubeDSL::DSLObject
    value_fields :external_id, :pod_cidr, :provider_id, :unschedulable
    array_field :pod_cidr
    array_field(:taint) { KubeDSL::DSL::V1::Taint.new }
    object_field(:config_source) { KubeDSL::DSL::V1::NodeConfigSource.new }

    def serialize
      {}.tap do |result|
        result[:externalID] = external_id
        result[:podCIDR] = pod_cidr
        result[:providerID] = provider_id
        result[:unschedulable] = unschedulable
        result[:podCIDRs] = pod_cidrs
        result[:taints] = taints.map(&:serialize)
        result[:configSource] = config_source.serialize
      end
    end

    def kind
      :node_spec
    end
  end
end
