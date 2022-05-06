# typed: true

module KubeDSL
  module DSL
    module V1
      class PodList < ::KubeDSL::DSLObject
        array_field(:item) { KubeDSL::DSL::V1::Pod.new }
        object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

        validates :items, array: { kind_of: KubeDSL::DSL::V1::Pod }, presence: false
        validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ListMeta }

        def serialize
          {}.tap do |result|
            result[:apiVersion] = "v1"
            result[:items] = items.map(&:serialize)
            result[:kind] = "PodList"
            result[:metadata] = metadata.serialize
          end
        end

        def kind_sym
          :pod_list
        end
      end
    end
  end
end