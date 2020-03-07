module KubeDSL::DSL::V1
  class PersistentVolumeStatus < ::KubeDSL::DSLObject
    value_fields :message, :phase, :reason

    def serialize
      {}.tap do |result|
        result[:message] = message
        result[:phase] = phase
        result[:reason] = reason
      end
    end

    def kind_sym
      :persistent_volume_status
    end
  end
end
