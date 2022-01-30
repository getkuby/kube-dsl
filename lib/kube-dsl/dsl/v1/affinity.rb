# typed: true

module KubeDSL::DSL::V1
  class Affinity < ::KubeDSL::DSLObject
    object_field(:node_affinity) { KubeDSL::DSL::V1::NodeAffinity.new }
    object_field(:pod_affinity) { KubeDSL::DSL::V1::PodAffinity.new }
    object_field(:pod_anti_affinity) { KubeDSL::DSL::V1::PodAntiAffinity.new }

    validates :node_affinity, object: { kind_of: KubeDSL::DSL::V1::NodeAffinity }
    validates :pod_affinity, object: { kind_of: KubeDSL::DSL::V1::PodAffinity }
    validates :pod_anti_affinity, object: { kind_of: KubeDSL::DSL::V1::PodAntiAffinity }

    def serialize
      {}.tap do |result|
        result[:nodeAffinity] = node_affinity.serialize
        result[:podAffinity] = pod_affinity.serialize
        result[:podAntiAffinity] = pod_anti_affinity.serialize
      end
    end

    def kind_sym
      :affinity
    end
  end
end
