module KubeDSL::DSL::V1
  class ExecAction
    extend ::KubeDSL::ValueFields

    array_field :command

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:command] = commands
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :exec_action
    end
  end
end
