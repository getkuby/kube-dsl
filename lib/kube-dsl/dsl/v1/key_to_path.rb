module KubeDSL::DSL::V1
  class KeyToPath
    extend ::KubeDSL::ValueFields

    value_fields :key, :mode, :path

    def initialize(&block)
      instance_eval(&block) if block
    end

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

    def kind
      :key_to_path
    end
  end
end
