# typed: true

module KubeDSL::DSL::Autoscaling::V2beta1
  class MetricStatus < ::KubeDSL::DSLObject
    object_field(:external) { KubeDSL::DSL::Autoscaling::V2beta1::ExternalMetricStatus.new }
    object_field(:object) { KubeDSL::DSL::Autoscaling::V2beta1::ObjectMetricStatus.new }
    object_field(:pods) { KubeDSL::DSL::Autoscaling::V2beta1::PodsMetricStatus.new }
    object_field(:resource) { KubeDSL::DSL::Autoscaling::V2beta1::ResourceMetricStatus.new }
    value_field :type

    validates :external, object: { kind_of: KubeDSL::DSL::Autoscaling::V2beta1::ExternalMetricStatus }
    validates :object, object: { kind_of: KubeDSL::DSL::Autoscaling::V2beta1::ObjectMetricStatus }
    validates :pods, object: { kind_of: KubeDSL::DSL::Autoscaling::V2beta1::PodsMetricStatus }
    validates :resource, object: { kind_of: KubeDSL::DSL::Autoscaling::V2beta1::ResourceMetricStatus }
    validates :type, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:external] = external.serialize
        result[:object] = object.serialize
        result[:pods] = pods.serialize
        result[:resource] = resource.serialize
        result[:type] = type
      end
    end

    def kind_sym
      :metric_status
    end
  end
end
