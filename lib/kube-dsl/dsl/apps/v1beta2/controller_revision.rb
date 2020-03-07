module KubeDSL::DSL::Apps::V1beta2
  class ControllerRevision < ::KubeDSL::DSLObject
    value_fields :data, :revision
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "apps/v1beta2"
        result[:kind] = "ControllerRevision"
        result[:data] = data
        result[:revision] = revision
        result[:metadata] = metadata.serialize
      end
    end

    def kind_sym
      :controller_revision
    end
  end
end
