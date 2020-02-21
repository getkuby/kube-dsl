module KubeDSL::DSL::Coordination::V1beta1
  class LeaseList
    extend ::KubeDSL::ValueFields

    array_field(:item) { KubeDSL::DSL::Coordination::V1beta1::Lease.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "coordination.k8s.io/v1beta1"
        result[:kind] = "LeaseList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :lease_list
    end
  end
end
