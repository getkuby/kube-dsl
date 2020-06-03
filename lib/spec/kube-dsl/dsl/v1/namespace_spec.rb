require './lib/spec/spec_helper'

describe KubeDSL::DSL::V1::Namespace do
  subject(:object) { described_class.new }

  describe '#validate!' do
    context 'when metadata is an object' do
      specify do
        expect(object.validate!).to be_truthy
      end
    end

    context 'when metadata is not an object' do
      specify do
        expect(object.validate!).to be_falsey
      end
    end
  end
end
