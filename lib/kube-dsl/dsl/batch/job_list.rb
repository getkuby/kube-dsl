module KubeDSL::DSL::Batch
  class JobList
    extend ::KubeDSL::ValueFields

    array_field(:item) { KubeDSL::DSL::Batch::Job.new }
    object_field(:metadata) { KubeDSL::DSL::Meta::ListMeta.new }

    def serialize
      {}.tap do |result|
        result[:apiVersion] = "batch/v1"
        result[:kind] = "JobList"
        result[:items] = items.map(&:serialize)
        result[:metadata] = metadata.serialize
      end
    end

    def to_resource
      ::KubeDSL::Resource.new(serialize)
    end

    def kind
      :job_list
    end
  end
end
