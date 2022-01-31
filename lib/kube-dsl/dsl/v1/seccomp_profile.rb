# typed: true

module KubeDSL::DSL::V1
  class SeccompProfile < ::KubeDSL::DSLObject
    value_field :localhost_profile
    value_field :type

    validates :localhost_profile, field: { format: :string }, presence: false
    validates :type, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:localhostProfile] = localhost_profile
        result[:type] = type
      end
    end

    def kind_sym
      :seccomp_profile
    end
  end
end
