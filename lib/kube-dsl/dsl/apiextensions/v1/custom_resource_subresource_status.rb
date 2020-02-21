module KubeDSL::DSL::Apiextensions::V1
  class CustomResourceSubresourceStatus
    extend ::KubeDSL::ValueFields


    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :custom_resource_subresource_status
    end
  end
end
