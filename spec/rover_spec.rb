require 'spec_helper'

describe Rover do
  let(:network) { double('network') }
  let(:planet) { double('planet') }

  before :each do
    expect(network).to receive(:register)
    expect(planet).to receive(:landed_by)
    @object = Rover.new(name: 'marsrover1', network: network, planet: planet)
  end

  describe '#listen' do
    it 'notifies to network with final position' do
      expect(network).to receive(:notify)
      @object.listen([])
    end
  end
end
