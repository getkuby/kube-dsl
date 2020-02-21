module KubeDSL::DSL::Storage::V1beta1
  class VolumeError
    extend ::KubeDSL::ValueFields

    value_fields :message, :time

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:message] = message
        result[:time] = time
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :volume_error
    end
  end
end
