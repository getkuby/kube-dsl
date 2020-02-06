module KubeDSL::DSL::Apps
  class ControllerRevision
    extend ::KubeDSL::ValueFields
    value_fields :data, :revision
    object_field(:metadata) { KubeDSL::DSL::Meta::ObjectMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "apps/v1beta2"
        result[:kind] = "ControllerRevision"
        result[:data] = data
        result[:revision] = revision
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
