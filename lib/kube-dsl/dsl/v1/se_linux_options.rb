# typed: true

module KubeDSL
  module DSL
    module V1
      class SELinuxOptions < ::KubeDSL::DSLObject
        value_field :level
        value_field :role
        value_field :type
        value_field :user

        validates :level, field: { format: :string }, presence: false
        validates :role, field: { format: :string }, presence: false
        validates :type, field: { format: :string }, presence: false
        validates :user, field: { format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:level] = level
            result[:role] = role
            result[:type] = type
            result[:user] = user
          end
        end

        def kind_sym
          :se_linux_options
        end
      end
    end
  end
end