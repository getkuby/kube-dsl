# typed: true

module KubeDSL::DSL::V1
  class ExecAction < ::KubeDSL::DSLObject
    value_field :command

    validates :command, field: { format: :string }, presence: false

    def serialize
      {}.tap do |result|
        result[:command] = command
      end
    end

    def kind_sym
      :exec_action
    end
  end
end
