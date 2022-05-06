# typed: true

module KubeDSL
  module DSL
    module V1
      class GlusterfsVolumeSource < ::KubeDSL::DSLObject
        value_field :endpoints
        value_field :path
        value_field :read_only

        validates :endpoints, field: { format: :string }, presence: false
        validates :path, field: { format: :string }, presence: false
        validates :read_only, field: { format: :boolean }, presence: false

        def serialize
          {}.tap do |result|
            result[:endpoints] = endpoints
            result[:path] = path
            result[:readOnly] = read_only
          end
        end

        def kind_sym
          :glusterfs_volume_source
        end
      end
    end
  end
end