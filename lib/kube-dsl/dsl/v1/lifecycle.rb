module KubeDSL::DSL::V1
  class Lifecycle
    extend ::KubeDSL::ValueFields

    object_field(:post_start) { KubeDSL::DSL::V1::Handler.new }
    object_field(:pre_stop) { KubeDSL::DSL::V1::Handler.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:postStart] = post_start.serialize
        result[:preStop] = pre_stop.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :lifecycle
    end
  end
end
