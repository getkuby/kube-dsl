# typed: strict
module KubeDSL::DSL::Discovery::V1beta1
  autoload :Endpoint, 'kube-dsl/dsl/discovery/v1beta1/endpoint'
  autoload :EndpointConditions, 'kube-dsl/dsl/discovery/v1beta1/endpoint_conditions'
  autoload :EndpointHints, 'kube-dsl/dsl/discovery/v1beta1/endpoint_hints'
  autoload :EndpointPort, 'kube-dsl/dsl/discovery/v1beta1/endpoint_port'
  autoload :EndpointSlice, 'kube-dsl/dsl/discovery/v1beta1/endpoint_slice'
  autoload :EndpointSliceList, 'kube-dsl/dsl/discovery/v1beta1/endpoint_slice_list'
  autoload :ForZone, 'kube-dsl/dsl/discovery/v1beta1/for_zone'
end
