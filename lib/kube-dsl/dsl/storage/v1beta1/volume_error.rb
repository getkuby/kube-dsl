module KubeDSL::DSL::Storage::V1beta1
  class VolumeError < ::KubeDSL::DSLObject
    value_fields :message, :time

    def serialize
      {}.tap do |result|
        result[:message] = message
        result[:time] = time
      end
    end

    def kind
      :volume_error
    end
  end
end
