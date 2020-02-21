module KubeDSL::DSL::Flowcontrol::V1alpha1
  class LimitResponse
    extend ::KubeDSL::ValueFields

    value_fields :type
    object_field(:queuing) { KubeDSL::DSL::Flowcontrol::V1alpha1::QueuingConfiguration.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:type] = type
        result[:queuing] = queuing.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :limit_response
    end
  end
end
