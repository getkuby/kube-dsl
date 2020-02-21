module KubeDSL::DSL::V1
  class EmptyDirVolumeSource
    extend ::KubeDSL::ValueFields

    value_fields :medium, :size_limit

    def initialize(&block)
      instance_eval(&block) if block
    end

    def serialize
      {}.tap do |result|
        result[:medium] = medium
        result[:sizeLimit] = size_limit
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :empty_dir_volume_source
    end
  end
end
