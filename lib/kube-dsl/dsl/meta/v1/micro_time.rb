module KubeDSL::DSL::Meta::V1
  class MicroTime < ::KubeDSL::DSLObject

    def serialize
      {}.tap do |result|
      end
    end

    def kind_sym
      :micro_time
    end
  end
end
