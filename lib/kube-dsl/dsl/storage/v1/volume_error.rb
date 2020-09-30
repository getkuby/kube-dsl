module KubeDSL::DSL::Storage::V1
  class VolumeError < ::KubeDSL::DSLObject
    value_field :message
    value_field :time

    validates :message, field: { format: :string }, presence: false
    validates :time, field: { format: :string }, presence: false

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
