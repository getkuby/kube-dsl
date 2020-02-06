module KubeDSL::DSL
  class NodeStatus
    extend ::KubeDSL::ValueFields

    value_fields :phase
    array_field(:address) { KubeDSL::DSL::NodeAddress.new }
    array_field(:condition) { KubeDSL::DSL::NodeCondition.new }
    array_field(:image) { KubeDSL::DSL::ContainerImage.new }
    array_field(:volumes_attached) { KubeDSL::DSL::AttachedVolume.new }
    array_field :volumes_in_use
    object_field(:config) { KubeDSL::DSL::NodeConfigStatus.new }
    object_field(:daemon_endpoints) { KubeDSL::DSL::NodeDaemonEndpoints.new }
    object_field(:node_info) { KubeDSL::DSL::NodeSystemInfo.new }
    object_field(:allocatable) { ::KubeDSL::KeyValueFields.new }
    object_field(:capacity) { ::KubeDSL::KeyValueFields.new }

    def serialize
      {}.tap do |result|
        result[:phase] = phase
        result[:addresses] = addresses.map(&:serialize)
        result[:conditions] = conditions.map(&:serialize)
        result[:images] = images.map(&:serialize)
        result[:volumesAttached] = volumes_attacheds.map(&:serialize)
        result[:volumesInUse] = volumes_in_uses
        result[:config] = config.serialize
        result[:daemonEndpoints] = daemon_endpoints.serialize
        result[:nodeInfo] = node_info.serialize
        result[:allocatable] = allocatable.serialize
        result[:capacity] = capacity.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :node_status
    end
  end
end
