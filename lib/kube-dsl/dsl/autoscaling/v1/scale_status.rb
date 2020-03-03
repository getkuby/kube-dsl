module KubeDSL::DSL::Autoscaling::V1
  class ScaleStatus < ::KubeDSL::DSLObject
    value_fields :replicas, :selector

    def serialize
      {}.tap do |result|
        result[:replicas] = replicas
        result[:selector] = selector
      end
    end

    def kind
      :scale_status
    end
  end
end
