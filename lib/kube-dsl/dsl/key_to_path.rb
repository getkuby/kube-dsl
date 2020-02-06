module KubeDSL::DSL
  class KeyToPath
    extend ::KubeDSL::ValueFields
    value_fields :key, :mode, :path

    def serialize
      {}.tap do |result|
        result[:key] = key
        result[:mode] = mode
        result[:path] = path
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
