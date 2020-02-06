module KubeDSL::DSL::Auditregistration
  class Policy
    extend ::KubeDSL::ValueFields
    value_fields :level
    array_field :stage

    def serialize
      {}.tap do |result|
        result[:level] = level
        result[:stages] = stages
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
