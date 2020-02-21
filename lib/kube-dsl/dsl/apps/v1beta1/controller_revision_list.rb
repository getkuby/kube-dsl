module KubeDSL::DSL::Apps::V1beta1
  class ControllerRevisionList
    extend ::KubeDSL::ValueFields

    array_field(:item) { KubeDSL::DSL::Apps::V1beta1::ControllerRevision.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ListMeta.new }

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "apps/v1beta1"
        result[:kind] = "ControllerRevisionList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :controller_revision_list
    end
  end
end
