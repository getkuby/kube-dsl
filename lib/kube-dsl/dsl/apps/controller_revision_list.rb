module KubeDSL::DSL::Apps
  class ControllerRevisionList
    extend ::KubeDSL::ValueFields
    array_field(:item) { KubeDSL::DSL::Apps::ControllerRevision.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "apps/v1beta2"
        result[:kind] = "ControllerRevisionList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
