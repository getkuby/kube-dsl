module KubeDSL::DSL::Apiextensions::V1
  class JSON < ::KubeDSL::DSLObject

    def serialize
      {}.tap do |result|
      end
    end

    def kind
      :json
    end
  end
end
