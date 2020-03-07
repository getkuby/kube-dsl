module KubeDSL::DSL::V1
  class ExecAction < ::KubeDSL::DSLObject
    array_field :command

    def serialize
      {}.tap do |result|
        result[:command] = commands
      end
    end

    def kind_sym
      :exec_action
    end
  end
end
