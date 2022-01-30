# typed: true

module KubeDSL::DSL::Policy::V1beta1
  class AllowedCSIDriver < ::KubeDSL::DSLObject
    value_field :name

    validates :name, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:name] = name
      end
    end

    def kind_sym
      :allowed_csi_driver
    end
  end
end
