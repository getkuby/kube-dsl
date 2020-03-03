module KubeDSL::DSL::Apps::V1
  class ControllerRevision < ::KubeDSL::DSLObject
    value_fields :data, :revision
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "apps/v1"
        result[:kind] = "ControllerRevision"
        result[:data] = data
        result[:revision] = revision
        result[:metadata] = metadata.serialize
      end
    end

    def kind
      :controller_revision
    end
  end
end
