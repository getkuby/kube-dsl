module KubeDSL::DSL::V1
  class Capabilities < ::KubeDSL::DSLObject
    value_fields :add, :drop

    def serialize
      {}.tap do |result|
        result[:add] = add
        result[:drop] = drop
      end
    end

    def kind_sym
      :capabilities
    end
  end
end
