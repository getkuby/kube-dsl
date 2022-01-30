# typed: true

module KubeDSL::DSL::Policy::V1beta1
  class AllowedHostPath < ::KubeDSL::DSLObject
    value_field :path_prefix
    value_field :read_only

    validates :path_prefix, field: { format: :string }, presence: false
    validates :read_only, field: { format: :boolean }, presence: false

    def serialize
      {}.tap do |result|
        result[:pathPrefix] = path_prefix
        result[:readOnly] = read_only
      end
    end

    def kind_sym
      :allowed_host_path
    end
  end
end
