module KubeDSL::DSL
  class ExecAction
    extend ::KubeDSL::ValueFields
    array_field :command

    def serialize
      {}.tap do |result|
        result[:command] = commands
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
