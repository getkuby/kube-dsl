module KubeDSL
  class DSLObject
    extend ::KubeDSL::ValueFields

    def initialize(&block)
      instance_eval(&block) if block
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end
  end
end
