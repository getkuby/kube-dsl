module KubeDSL::DSL::Policy::V1beta1
  class AllowedCSIDriver < ::KubeDSL::DSLObject
    value_fields :name

    def serialize
      {}.tap do |result|
        result[:name] = name
      end
    end

    def kind
      :allowed_csi_driver
    end
  end
end
