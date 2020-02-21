module KubeDSL::DSL::V1
  class Affinity
    extend ::KubeDSL::ValueFields

    object_field(:node_affinity) { KubeDSL::DSL::V1::NodeAffinity.new }
    object_field(:pod_affinity) { KubeDSL::DSL::V1::PodAffinity.new }
    object_field(:pod_anti_affinity) { KubeDSL::DSL::V1::PodAntiAffinity.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

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
