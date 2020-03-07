module KubeDSL::DSL::V1
  class KeyToPath < ::KubeDSL::DSLObject
    value_fields :key, :mode, :path

    def serialize
      {}.tap do |result|
        result[:key] = key
        result[:mode] = mode
        result[:path] = path
      end
    end

    def kind_sym
      :key_to_path
    end
  end
end
