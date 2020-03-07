module KubeDSL::DSL::Meta::V1
  class Patch < ::KubeDSL::DSLObject

    def serialize
      {}.tap do |result|
      end
    end

    def kind_sym
      :patch
    end
  end
end
