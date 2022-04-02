# typed: strict

module KubeDSL
  module DSL
    module Apps
      module V1
        class ControllerRevision < ::KubeDSL::DSLObject
          sig {
            returns(
              T::Hash[Symbol, T.any(String, Integer, Float, T::Boolean, T::Array[T.untyped], T::Hash[Symbol, T.untyped])]
            )
          }
          def serialize; end

          sig { returns(Symbol) }
          def kind_sym; end


          sig { params(val: T.nilable(String)).returns(String) }
          def data(val = nil); end


          sig { returns(KubeDSL::DSL::Meta::V1::ObjectMeta) }
          def metadata; end

          sig { params(val: T.nilable(Integer)).returns(Integer) }
          def revision(val = nil); end
        end
      end
    end
  end
end