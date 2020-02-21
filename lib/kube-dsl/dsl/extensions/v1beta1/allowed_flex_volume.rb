module KubeDSL::DSL::Extensions::V1beta1
  class AllowedFlexVolume
    extend ::KubeDSL::ValueFields

    value_fields :driver

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:driver] = driver
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :allowed_flex_volume
    end
  end
end
