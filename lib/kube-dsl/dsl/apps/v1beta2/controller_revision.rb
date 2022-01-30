# typed: true

module KubeDSL::DSL::Apps::V1beta2
  class ControllerRevision < ::KubeDSL::DSLObject
    value_field :data
    object_field(:metadata) { KubeDSL::DSL::Meta::V1::ObjectMeta.new }
    value_field :revision

    validates :data, field: { format: :string }, presence: false
    validates :metadata, object: { kind_of: KubeDSL::DSL::Meta::V1::ObjectMeta }
    validates :revision, field: { format: :integer }, presence: false

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "apps/v1beta2"
        result[:data] = data
        result[:kind] = "ControllerRevision"
        result[:metadata] = metadata.serialize
        result[:revision] = revision
      end
    end

    def kind_sym
      :controller_revision
    end
  end
end
