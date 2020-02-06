module KubeDSL::DSL
  class Affinity
    extend ::KubeDSL::ValueFields

    object_field(:node_affinity) { KubeDSL::DSL::NodeAffinity.new }
    object_field(:pod_affinity) { KubeDSL::DSL::PodAffinity.new }
    object_field(:pod_anti_affinity) { KubeDSL::DSL::PodAntiAffinity.new }

    def serialize
      {}.tap do |result|
        result[:nodeAffinity] = node_affinity.serialize
        result[:podAffinity] = pod_affinity.serialize
        result[:podAntiAffinity] = pod_anti_affinity.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :affinity
    end
  end
end
