module KubeDSL::DSL::V1
  class VolumeNodeAffinity < ::KubeDSL::DSLObject
    object_field(:required) { KubeDSL::DSL::V1::NodeSelector.new }

    def serialize
      {}.tap do |result|
        result[:required] = required.serialize
      end
    end

    def kind_sym
      :volume_node_affinity
    end
  end
end
