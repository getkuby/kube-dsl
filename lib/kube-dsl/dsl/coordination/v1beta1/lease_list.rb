# typed: true

module KubeDSL::DSL::Coordination::V1beta1
  class LeaseList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Coordination::V1beta1::Lease.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    validates :items, array: { kind_of: KubeDSL::DSL::Coordination::V1beta1::Lease }, presence: false
    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ListMeta }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "coordination.k8s.io/v1beta1"
        result[:items] = items.map(&:serialize)
        result[:kind] = "LeaseList"
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :lease_list
    end
  end
end
