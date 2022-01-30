# typed: true

module KubeDSL::DSL::V1
  class NFSVolumeSource < ::KubeDSL::DSLObject
    value_field :path
    value_field :read_only
    value_field :server

    validates :path, field: { format: :string }, presence: false
    validates :read_only, field: { format: :boolean }, presence: false
    validates :server, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:path] = path
        result[:readOnly] = read_only
        result[:server] = server
      end
    end

    def kind_sym
      :nfs_volume_source
    end
  end
end
