module KubeDSL::DSL::V1
  class VolumeNodeAffinity
    extend ::KubeDSL::ValueFields

    object_field(:required) { KubeDSL::DSL::V1::NodeSelector.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:required] = required.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :volume_node_affinity
    end
  end
end
