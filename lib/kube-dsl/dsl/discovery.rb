module KubeDSL::DSL::Discovery
  autoload :Endpoint, 'kube-dsl/dsl/discovery/endpoint'
  autoload :EndpointConditions, 'kube-dsl/dsl/discovery/endpoint_conditions'
  autoload :EndpointPort, 'kube-dsl/dsl/discovery/endpoint_port'
  autoload :EndpointSlice, 'kube-dsl/dsl/discovery/endpoint_slice'
  autoload :EndpointSliceList, 'kube-dsl/dsl/discovery/endpoint_slice_list'
end
