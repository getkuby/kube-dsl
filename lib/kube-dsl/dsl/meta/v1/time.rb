module KubeDSL::DSL::Meta::V1
  class Time < ::KubeDSL::DSLObject

    def serialize
      {}.tap do |result|
      end
    end

    def kind_sym
      :time
    end
  end
end
