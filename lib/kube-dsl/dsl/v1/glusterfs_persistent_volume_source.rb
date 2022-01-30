# typed: true

module KubeDSL::DSL::V1
  class GlusterfsPersistentVolumeSource < ::KubeDSL::DSLObject
    value_field :endpoints
    value_field :endpoints_namespace
    value_field :path
    value_field :read_only

    validates :endpoints, field: { format: :string }, presence: false
    validates :endpoints_namespace, field: { format: :string }, presence: false
    validates :path, field: { format: :string }, presence: false
    validates :read_only, field: { format: :boolean }, presence: false

    def serialize
      {}.tap do |result|
        result[:endpoints] = endpoints
        result[:endpointsNamespace] = endpoints_namespace
        result[:path] = path
        result[:readOnly] = read_only
      end
    end

    def kind_sym
      :glusterfs_persistent_volume_source
    end
  end
end
