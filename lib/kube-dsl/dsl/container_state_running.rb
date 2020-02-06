module KubeDSL::DSL
  class ContainerStateRunning
    extend ::KubeDSL::ValueFields
    value_fields :started_at

    def serialize
      {}.tap do |result|
        result[:startedAt] = started_at
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
