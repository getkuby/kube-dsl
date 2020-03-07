module KubeDSL::DSL::V1
  class Lifecycle < ::KubeDSL::DSLObject
    object_field(:post_start) { KubeDSL::DSL::V1::Handler.new }
    object_field(:pre_stop) { KubeDSL::DSL::V1::Handler.new }

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
