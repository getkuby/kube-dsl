module KubeDSL::DSL::Policy
  class AllowedCSIDriver
    extend ::KubeDSL::ValueFields
    value_fields :name

    def serialize
      {}.tap do |result|
        result[:name] = name
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
