module KubeDSL::DSL::Flowcontrol
  class LimitResponse
    extend ::KubeDSL::ValueFields

    value_fields :type
    object_field(:queuing) { KubeDSL::DSL::Flowcontrol::QueuingConfiguration.new }

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
