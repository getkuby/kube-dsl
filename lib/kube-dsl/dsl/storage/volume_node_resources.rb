module KubeDSL::DSL::Storage
  class VolumeNodeResources
    extend ::KubeDSL::ValueFields

    value_fields :count

    def serialize
      {}.tap do |result|
        result[:count] = count
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :volume_node_resources
    end
  end
end
