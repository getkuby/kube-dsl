module KubeDSL::DSL::Storage
  class VolumeError
    extend ::KubeDSL::ValueFields
    value_fields :message, :time

    def serialize
      {}.tap do |result|
        result[:message] = message
        result[:time] = time
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
