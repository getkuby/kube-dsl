# typed: strict

module KubeDSL::DSL::Apiextensions::V1beta1
  class JSON < ::KubeDSL::DSLObject
    def serialize
      @value
    end

    def value(val = nil)
      if val
        @value = val
      end

      @value
    end

    def kind_sym
      :JSON
    end
  end
end
