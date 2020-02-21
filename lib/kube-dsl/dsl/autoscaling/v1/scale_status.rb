module KubeDSL::DSL::Autoscaling::V1
  class ScaleStatus
    extend ::KubeDSL::ValueFields

    value_fields :replicas, :selector

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:replicas] = replicas
        result[:selector] = selector
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :scale_status
    end
  end
end
