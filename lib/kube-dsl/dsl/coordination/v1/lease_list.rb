module KubeDSL::DSL::Coordination::V1
  class LeaseList < ::KubeDSL::DSLObject
    array_field(:item) { KubeDSL::DSL::Coordination::V1::Lease.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "coordination.k8s.io/v1"
        result[:kind] = "LeaseList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :lease_list
    end
  end
end
