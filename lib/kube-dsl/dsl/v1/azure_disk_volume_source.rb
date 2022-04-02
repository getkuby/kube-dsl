# typed: true

module KubeDSL
  module DSL
    module V1
      class AzureDiskVolumeSource < ::KubeDSL::DSLObject
        value_field :caching_mode
        value_field :disk_name
        value_field :disk_uri
        value_field :fs_type
        value_field :kind
        value_field :read_only

        validates :caching_mode, field: { format: :string }, presence: false
        validates :disk_name, field: { format: :string }, presence: false
        validates :disk_uri, field: { format: :string }, presence: false
        validates :fs_type, field: { format: :string }, presence: false
        validates :kind, field: { format: :string }, presence: false
        validates :read_only, field: { format: :boolean }, presence: false

        def serialize
          {}.tap do |result|
            result[:cachingMode] = caching_mode
            result[:diskName] = disk_name
            result[:diskURI] = disk_uri
            result[:fsType] = fs_type
            result[:kind] = kind
            result[:readOnly] = read_only
          end
        end

        def kind_sym
          :azure_disk_volume_source
        end
      end
    end
  end
end