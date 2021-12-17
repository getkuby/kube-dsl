module KubeDSL::DSL::Storage::V1
  class CSIDriver < ::KubeDSL::DSLObject
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    object_field(:spec) { KubeDSL::DSL::Storage::V1::CSIDriverSpec.new }

    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
    validates :spec, object: { kind_of: KubeDSL::DSL::Storage::V1::CSIDriverSpec }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "storage.k8s.io/v1"
        result[:kind] = "CSIDriver"
        result[:metadata] = metadata.serialize
        result[:spec] = spec.serialize
      end
    end

    def kind_sym
      :csi_driver
    end
  end
end
