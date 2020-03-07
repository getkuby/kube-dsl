module KubeDSL::DSL::Policy::V1beta1
  class AllowedFlexVolume < ::KubeDSL::DSLObject
    value_fields :driver

    def serialize
      {}.tap do |result|
        result[:driver] = driver
      end
    end

    def kind_sym
      :allowed_flex_volume
    end
  end
end
