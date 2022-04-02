# typed: true

module KubeDSL
  module DSL
    module V1
      class QuobyteVolumeSource < ::KubeDSL::DSLObject
        value_field :group
        value_field :read_only
        value_field :registry
        value_field :tenant
        value_field :user
        value_field :volume

        validates :group, field: { format: :string }, presence: false
        validates :read_only, field: { format: :boolean }, presence: false
        validates :registry, field: { format: :string }, presence: false
        validates :tenant, field: { format: :string }, presence: false
        validates :user, field: { format: :string }, presence: false
        validates :volume, field: { format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:group] = group
            result[:readOnly] = read_only
            result[:registry] = registry
            result[:tenant] = tenant
            result[:user] = user
            result[:volume] = volume
          end
        end

        def kind_sym
          :quobyte_volume_source
        end
      end
    end
  end
end