# typed: strict

module KubeDSL
  module Validations
    module ClassMethods
      sig { params(field_name: T.untyped, options: T.untyped).returns(T.untyped) }
      def validates(field_name, options); end
    end
  end
end
