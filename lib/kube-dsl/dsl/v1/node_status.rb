module KubeDSL::DSL::V1
  class NodeStatus < ::KubeDSL::DSLObject
    value_fields :phase
    array_field(:address) { KubeDSL::DSL::V1::NodeAddress.new }
    array_field(:condition) { KubeDSL::DSL::V1::NodeCondition.new }
    array_field(:image) { KubeDSL::DSL::V1::ContainerImage.new }
    array_field(:volumes_attached) { KubeDSL::DSL::V1::AttachedVolume.new }
    array_field :volumes_in_use
    object_field(:config) { KubeDSL::DSL::V1::NodeConfigStatus.new }
    object_field(:daemon_endpoints) { KubeDSL::DSL::V1::NodeDaemonEndpoints.new }
    object_field(:node_info) { KubeDSL::DSL::V1::NodeSystemInfo.new }
    object_field(:allocatable) { ::KubeDSL::KeyValueFields.new(format: :string) }
    object_field(:capacity) { ::KubeDSL::KeyValueFields.new(format: :string) }

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

    def kind
      :node_status
    end
  end
end
