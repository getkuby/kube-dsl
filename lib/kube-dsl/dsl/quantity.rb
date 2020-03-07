module KubeDSL::DSL
  class Quantity < ::KubeDSL::DSLObject

    def serialize
      {}.tap do |result|
      end
    end

    def kind_sym
      :quantity
    end
  end
end
