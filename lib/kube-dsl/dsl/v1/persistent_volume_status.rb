module KubeDSL::DSL::V1
  class PersistentVolumeStatus
    extend ::KubeDSL::ValueFields

    value_fields :message, :phase, :reason

    def initialize(&block)
      instance_eval(&block) if block
    end

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

    def kind
      :persistent_volume_status
    end
  end
end
