# typed: strict

module KubeDSL
  module DSL
    module V1
      class GitRepoVolumeSource < ::KubeDSL::DSLObject
        value_field :directory
        value_field :repository
        value_field :revision

        validates :directory, field: { format: :string }, presence: false
        validates :repository, field: { format: :string }, presence: false
        validates :revision, field: { format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:directory] = directory
            result[:repository] = repository
            result[:revision] = revision
          end
        end

        def kind_sym
          :git_repo_volume_source
        end
      end
    end
  end
end