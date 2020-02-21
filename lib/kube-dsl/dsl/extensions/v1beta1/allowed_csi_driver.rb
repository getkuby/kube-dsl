module KubeDSL::DSL::Extensions::V1beta1
  class AllowedCSIDriver
    extend ::KubeDSL::ValueFields

    value_fields :name

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:name] = name
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :allowed_csi_driver
    end
  end
end
