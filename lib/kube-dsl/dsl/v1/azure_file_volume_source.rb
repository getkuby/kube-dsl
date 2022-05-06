# typed: strict

module KubeDSL
  module DSL
    module V1
      class AzureFileVolumeSource < ::KubeDSL::DSLObject
        value_field :read_only
        value_field :secret_name
        value_field :share_name

        validates :read_only, field: { format: :boolean }, presence: false
        validates :secret_name, field: { format: :string }, presence: false
        validates :share_name, field: { format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:readOnly] = read_only
            result[:secretName] = secret_name
            result[:shareName] = share_name
          end
        end

        def kind_sym
          :azure_file_volume_source
        end
      end
    end
  end
end