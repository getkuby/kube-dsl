module KubeDSL::DSL::Extensions
  class RollbackConfig
    extend ::KubeDSL::ValueFields
    value_fields :revision

    def serialize
      {}.tap do |result|
        result[:revision] = revision
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
