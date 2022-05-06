# typed: true

module KubeDSL
  module DSL
    module V1
      class NodeSystemInfo < ::KubeDSL::DSLObject
        value_field :architecture
        value_field :boot_id
        value_field :container_runtime_version
        value_field :kernel_version
        value_field :kube_proxy_version
        value_field :kubelet_version
        value_field :machine_id
        value_field :operating_system
        value_field :os_image
        value_field :system_uuid

        validates :architecture, field: { format: :string }, presence: false
        validates :boot_id, field: { format: :string }, presence: false
        validates :container_runtime_version, field: { format: :string }, presence: false
        validates :kernel_version, field: { format: :string }, presence: false
        validates :kube_proxy_version, field: { format: :string }, presence: false
        validates :kubelet_version, field: { format: :string }, presence: false
        validates :machine_id, field: { format: :string }, presence: false
        validates :operating_system, field: { format: :string }, presence: false
        validates :os_image, field: { format: :string }, presence: false
        validates :system_uuid, field: { format: :string }, presence: false

        def serialize
          {}.tap do |result|
            result[:architecture] = architecture
            result[:bootID] = boot_id
            result[:containerRuntimeVersion] = container_runtime_version
            result[:kernelVersion] = kernel_version
            result[:kubeProxyVersion] = kube_proxy_version
            result[:kubeletVersion] = kubelet_version
            result[:machineID] = machine_id
            result[:operatingSystem] = operating_system
            result[:osImage] = os_image
            result[:systemUUID] = system_uuid
          end
        end

        def kind_sym
          :node_system_info
        end
      end
    end
  end
end