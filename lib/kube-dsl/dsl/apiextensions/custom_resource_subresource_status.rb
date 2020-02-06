module KubeDSL::DSL::Apiextensions
  class CustomResourceSubresourceStatus
    extend ::KubeDSL::ValueFields


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
