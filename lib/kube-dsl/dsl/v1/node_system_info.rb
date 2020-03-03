module KubeDSL::DSL::V1
  class NodeSystemInfo < ::KubeDSL::DSLObject
    value_fields :architecture, :boot_id, :container_runtime_version, :kernel_version, :kube_proxy_version, :kubelet_version, :machine_id, :operating_system, :os_image, :system_uuid

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

    def kind
      :node_system_info
    end
  end
end
