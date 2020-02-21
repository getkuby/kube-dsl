module KubeDSL::DSL::Networking::V1
  autoload :IPBlock, 'kube-dsl/dsl/networking/v1/ip_block'
  autoload :NetworkPolicy, 'kube-dsl/dsl/networking/v1/network_policy'
  autoload :NetworkPolicyEgressRule, 'kube-dsl/dsl/networking/v1/network_policy_egress_rule'
  autoload :NetworkPolicyIngressRule, 'kube-dsl/dsl/networking/v1/network_policy_ingress_rule'
  autoload :NetworkPolicyList, 'kube-dsl/dsl/networking/v1/network_policy_list'
  autoload :NetworkPolicyPeer, 'kube-dsl/dsl/networking/v1/network_policy_peer'
  autoload :NetworkPolicyPort, 'kube-dsl/dsl/networking/v1/network_policy_port'
  autoload :NetworkPolicySpec, 'kube-dsl/dsl/networking/v1/network_policy_spec'
end
