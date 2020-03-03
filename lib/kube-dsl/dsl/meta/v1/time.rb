module KubeDSL::DSL::Meta::V1
  class Time < ::KubeDSL::DSLObject

    def serialize
      {}.tap do |result|
      end
    end

    def kind
      :time
    end
  end
end
