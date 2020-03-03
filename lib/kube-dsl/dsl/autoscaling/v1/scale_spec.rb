module KubeDSL::DSL::Autoscaling::V1
  class ScaleSpec < ::KubeDSL::DSLObject
    value_fields :replicas

    def serialize
      {}.tap do |result|
        result[:replicas] = replicas
      end
    end

    def kind
      :scale_spec
    end
  end
end
