module KubeDSL::DSL
  class NodeSpec
    extend ::KubeDSL::ValueFields
    value_fields :external_id, :pod_cidr, :provider_id, :unschedulable
    array_field :pod_cidr
    array_field(:taint) { KubeDSL::DSL::Taint.new }
    object_field(:config_source) { KubeDSL::DSL::NodeConfigSource.new }

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

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
