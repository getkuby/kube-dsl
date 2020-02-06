module KubeDSL::DSL
  class VolumeNodeAffinity
    extend ::KubeDSL::ValueFields
    object_field(:required) { KubeDSL::DSL::NodeSelector.new }

    def serialize
      {}.tap do |result|
        result[:required] = required.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
