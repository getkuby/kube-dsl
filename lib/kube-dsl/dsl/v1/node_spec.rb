module KubeDSL::DSL::V1
  class NodeSpec < ::KubeDSL::DSLObject
    object_field(:config_source) { KubeDSL::DSL::V1::NodeConfigSource.new }
    value_field :external_id
    value_field :pod_cidr
    value_field :pod_cid_rs
    value_field :provider_id
    array_field(:taint) { KubeDSL::DSL::V1::Taint.new }
    value_field :unschedulable

    validates :config_source, object: { kind_of: KubeDSL::DSL::V1::NodeConfigSource }
    validates :external_id, field: { format: :string }, presence: false
    validates :pod_cidr, field: { format: :string }, presence: false
    validates :pod_cid_rs, field: { format: :string }, presence: false
    validates :provider_id, field: { format: :string }, presence: false
    validates :taints, array: { kind_of: KubeDSL::DSL::V1::Taint }, presence: false
    validates :unschedulable, field: { format: :boolean }, presence: false

    def serialize
      {}.tap do |result|
        result[:configSource] = config_source.serialize
        result[:externalID] = external_id
        result[:podCIDR] = pod_cidr
        result[:podCIDRs] = pod_cid_rs
        result[:providerID] = provider_id
        result[:taints] = taints.map(&:serialize)
        result[:unschedulable] = unschedulable
      end
    end

    def kind_sym
      :node_spec
    end
  end
end
