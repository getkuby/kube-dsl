module KubeDSL::DSL::Auditregistration::V1alpha1
  class Policy
    extend ::KubeDSL::ValueFields

    value_fields :level
    array_field :stage

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:level] = level
        result[:stages] = stages
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :policy
    end
  end
end
