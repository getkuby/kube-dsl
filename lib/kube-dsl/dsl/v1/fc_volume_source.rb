module KubeDSL::DSL::V1
  class FCVolumeSource < ::KubeDSL::DSLObject
    value_field :fs_type
    value_field :lun
    value_field :read_only
    value_field :target_ww_ns
    value_field :wwids

    validates :fs_type, field: { format: :string }, presence: false
    validates :lun, field: { format: :integer }, presence: false
    validates :read_only, field: { format: :boolean }, presence: false
    validates :target_ww_ns, field: { format: :string }, presence: false
    validates :wwids, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:fsType] = fs_type
        result[:lun] = lun
        result[:readOnly] = read_only
        result[:targetWWNs] = target_ww_ns
        result[:wwids] = wwids
      end
    end

    def kind_sym
      :fc_volume_source
    end
  end
end
