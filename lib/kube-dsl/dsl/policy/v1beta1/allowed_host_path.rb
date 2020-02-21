module KubeDSL::DSL::Policy::V1beta1
  class AllowedHostPath
    extend ::KubeDSL::ValueFields

    value_fields :path_prefix, :read_only

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:pathPrefix] = path_prefix
        result[:readOnly] = read_only
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :allowed_host_path
    end
  end
end
