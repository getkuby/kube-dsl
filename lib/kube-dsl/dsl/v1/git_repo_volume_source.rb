module KubeDSL::DSL::V1
  class GitRepoVolumeSource < ::KubeDSL::DSLObject
    value_fields :directory, :repository, :revision

    def serialize
      {}.tap do |result|
        result[:directory] = directory
        result[:repository] = repository
        result[:revision] = revision
      end
    end

    def kind
      :git_repo_volume_source
    end
  end
end
