require 'spec_helper'

describe Station do
  let(:network) { double('network') }

  before :each do
    expect(network).to receive(:register)
    @object = Station.new(name: 'test1', network: network)
  end

  it_behaves_like 'is_connectable'

  describe '#report' do
    it 'returns messages as a string one per line' do
      messages = ['1 1 N', '2 3 S']
      @object.listen(messages)
      expect(@object.report).to eq(messages.join("\n"))
    end
  end
end
