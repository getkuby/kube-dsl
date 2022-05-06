# typed: true

module KubeDSL
  module DSL
    module V1
      class Binding < ::KubeDSL::DSLObject
        object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
        object_field(:target) { KubeDSL::DSL::V1::ObjectReference.new }

        validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
        validates :target, object: { kind_of: KubeDSL::DSL::V1::ObjectReference }

        def serialize
          {}.tap do |result|
            result[:apiVersion] = "v1"
            result[:kind] = "Binding"
            result[:metadata] = metadata.serialize
            result[:target] = target.serialize
          end
        end

        def kind_sym
          :binding
        end
      end
    end
  end
end