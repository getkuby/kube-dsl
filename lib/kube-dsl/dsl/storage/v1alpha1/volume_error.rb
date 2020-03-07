module KubeDSL::DSL::Storage::V1alpha1
  class VolumeError < ::KubeDSL::DSLObject
    value_fields :message, :time

    def serialize
      {}.tap do |result|
        result[:message] = message
        result[:time] = time
      end
    end

    def kind_sym
      :volume_error
    end
  end
end
