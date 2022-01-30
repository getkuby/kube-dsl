# typed: true

module KubeDSL::DSL::V1
  class NodeStatus < ::KubeDSL::DSLObject
    array_field(:address) { KubeDSL::DSL::V1::NodeAddress.new }
    key_value_field(:allocatable, format: :string)
    key_value_field(:capacity, format: :string)
    array_field(:condition) { KubeDSL::DSL::V1::NodeCondition.new }
    object_field(:config) { KubeDSL::DSL::V1::NodeConfigStatus.new }
    object_field(:daemon_endpoints) { KubeDSL::DSL::V1::NodeDaemonEndpoints.new }
    array_field(:image) { KubeDSL::DSL::V1::ContainerImage.new }
    object_field(:node_info) { KubeDSL::DSL::V1::NodeSystemInfo.new }
    value_field :phase
    array_field(:volumes_attached) { KubeDSL::DSL::V1::AttachedVolume.new }
    value_field :volumes_in_use

    validates :addresses, array: { kind_of: KubeDSL::DSL::V1::NodeAddress }, presence: false
    validates :allocatable, kv: { value_format: :string }, presence: false
    validates :capacity, kv: { value_format: :string }, presence: false
    validates :conditions, array: { kind_of: KubeDSL::DSL::V1::NodeCondition }, presence: false
    validates :config, object: { kind_of: KubeDSL::DSL::V1::NodeConfigStatus }
    validates :daemon_endpoints, object: { kind_of: KubeDSL::DSL::V1::NodeDaemonEndpoints }
    validates :images, array: { kind_of: KubeDSL::DSL::V1::ContainerImage }, presence: false
    validates :node_info, object: { kind_of: KubeDSL::DSL::V1::NodeSystemInfo }
    validates :phase, field: { format: :string }, presence: false
    validates :volumes_attacheds, array: { kind_of: KubeDSL::DSL::V1::AttachedVolume }, presence: false
    validates :volumes_in_use, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:addresses] = addresses.map(&:serialize)
        result[:allocatable] = allocatable.serialize
        result[:capacity] = capacity.serialize
        result[:conditions] = conditions.map(&:serialize)
        result[:config] = config.serialize
        result[:daemonEndpoints] = daemon_endpoints.serialize
        result[:images] = images.map(&:serialize)
        result[:nodeInfo] = node_info.serialize
        result[:phase] = phase
        result[:volumesAttached] = volumes_attacheds.map(&:serialize)
        result[:volumesInUse] = volumes_in_use
      end
    end

    def kind_sym
      :node_status
    end
  end
end
