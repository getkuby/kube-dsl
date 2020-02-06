module KubeDSL::DSL
  class PersistentVolumeStatus
    extend ::KubeDSL::ValueFields
    value_fields :message, :phase, :reason

    def serialize
      {}.tap do |result|
        result[:message] = message
        result[:phase] = phase
        result[:reason] = reason
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
