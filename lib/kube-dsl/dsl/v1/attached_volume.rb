# typed: true

module KubeDSL
  module DSL
    module V1
      class AttachedVolume < ::KubeDSL::DSLObject
        value_field :device_path
        value_field :name

        validates :device_path, field: { format: :string }, presence: false
        validates :name, field: { format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:devicePath] = device_path
            result[:name] = name
          end
        end

        def kind_sym
          :attached_volume
        end
      end
    end
  end
end