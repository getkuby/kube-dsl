module KubeDSL::DSL::V1
  class EmptyDirVolumeSource < ::KubeDSL::DSLObject
    value_fields :medium, :size_limit

    def serialize
      {}.tap do |result|
        result[:medium] = medium
        result[:sizeLimit] = size_limit
      end
    end

    def kind_sym
      :empty_dir_volume_source
    end
  end
end
