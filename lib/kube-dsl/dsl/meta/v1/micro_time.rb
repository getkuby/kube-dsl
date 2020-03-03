module KubeDSL::DSL::Meta::V1
  class MicroTime < ::KubeDSL::DSLObject

    def serialize
      {}.tap do |result|
      end
    end

    def kind
      :micro_time
    end
  end
end
