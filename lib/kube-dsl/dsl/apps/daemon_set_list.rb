module KubeDSL::DSL::Apps
  class DaemonSetList
    extend ::KubeDSL::ValueFields
    array_field(:item) { KubeDSL::DSL::Apps::DaemonSet.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "apps/v1beta2"
        result[:kind] = "DaemonSetList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
