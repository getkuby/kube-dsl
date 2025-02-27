# typed: true

module KubeDSL
  module DSL
    module V1
      class Lifecycle < ::KubeDSL::DSLObject
        object_field(:post_start) { KubeDSL::DSL::V1::LifecycleHandler.new }
        object_field(:pre_stop) { KubeDSL::DSL::V1::LifecycleHandler.new }

        validates :post_start, object: { kind_of: KubeDSL::DSL::V1::LifecycleHandler }
        validates :pre_stop, object: { kind_of: KubeDSL::DSL::V1::LifecycleHandler }

        def serialize
          {}.tap do |result|
            result[:postStart] = post_start.serialize
            result[:preStop] = pre_stop.serialize
          end
        end

        def kind_sym
          :lifecycle
        end
      end
    end
  end
end