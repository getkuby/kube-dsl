# typed: strict

module KubeDSL
  module DSL
    module V1
      class FlockerVolumeSource < ::KubeDSL::DSLObject
        value_field :dataset_name
        value_field :dataset_uuid

        validates :dataset_name, field: { format: :string }, presence: false
        validates :dataset_uuid, field: { format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:datasetName] = dataset_name
            result[:datasetUUID] = dataset_uuid
          end
        end

        def kind_sym
          :flocker_volume_source
        end
      end
    end
  end
end