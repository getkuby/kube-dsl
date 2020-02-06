module KubeDSL::DSL::Meta
  class Preconditions
    extend ::KubeDSL::ValueFields
    value_fields :resource_version, :uid

    def serialize
      {}.tap do |result|
        result[:resourceVersion] = resource_version
        result[:uid] = uid
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
