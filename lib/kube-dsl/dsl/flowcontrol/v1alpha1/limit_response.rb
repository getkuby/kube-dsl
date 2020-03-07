module KubeDSL::DSL::Flowcontrol::V1alpha1
  class LimitResponse < ::KubeDSL::DSLObject
    value_fields :type
    object_field(:queuing) { KubeDSL::DSL::Flowcontrol::V1alpha1::QueuingConfiguration.new }

    def serialize
      {}.tap do |result|
        result[:type] = type
        result[:queuing] = queuing.serialize
      end
    end

    def kind_sym
      :limit_response
    end
  end
end
