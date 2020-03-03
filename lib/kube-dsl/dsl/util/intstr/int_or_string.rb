module KubeDSL::DSL::Util::Intstr
  class IntOrString < ::KubeDSL::DSLObject

    def serialize
      {}.tap do |result|
      end
    end

    def kind
      :int_or_string
    end
  end
end
