# typed: true

module KubeDSL
  module DSL
    module V1
      class HostPathVolumeSource < ::KubeDSL::DSLObject
        value_field :path
        value_field :type

        validates :path, field: { format: :string }, presence: false
        validates :type, field: { format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:path] = path
            result[:type] = type
          end
        end

        def kind_sym
          :host_path_volume_source
        end
      end
    end
  end
end