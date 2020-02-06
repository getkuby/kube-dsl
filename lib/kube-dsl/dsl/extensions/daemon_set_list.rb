module KubeDSL::DSL::Extensions
  class DaemonSetList
    extend ::KubeDSL::ValueFields
    array_field(:item) { KubeDSL::DSL::Extensions::DaemonSet.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "extensions/v1beta1"
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
