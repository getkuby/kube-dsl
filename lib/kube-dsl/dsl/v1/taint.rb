module KubeDSL::DSL::V1
  class Taint < ::KubeDSL::DSLObject
    value_fields :effect, :key, :time_added, :value

    def serialize
      {}.tap do |result|
        result[:effect] = effect
        result[:key] = key
        result[:timeAdded] = time_added
        result[:value] = value
      end
    end

    def kind_sym
      :taint
    end
  end
end
