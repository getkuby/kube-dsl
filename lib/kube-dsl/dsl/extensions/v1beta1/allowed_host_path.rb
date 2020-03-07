module KubeDSL::DSL::Extensions::V1beta1
  class AllowedHostPath < ::KubeDSL::DSLObject
    value_fields :path_prefix, :read_only

    def serialize
      {}.tap do |result|
        result[:pathPrefix] = path_prefix
        result[:readOnly] = read_only
      end
    end

    def kind_sym
      :allowed_host_path
    end
  end
end
