# typed: true

module KubeDSL::DSL::V1
  class LocalVolumeSource < ::KubeDSL::DSLObject
    value_field :fs_type
    value_field :path

    validates :fs_type, field: { format: :string }, presence: false
    validates :path, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:fsType] = fs_type
        result[:path] = path
      end
    end

    def kind_sym
      :local_volume_source
    end
  end
end
