require 'spec_helper'

describe Planet do
  let(:dimension) { double('dimension') }
  let(:visitor) { double('visitor') }

  describe '#landed_by' do
    context 'position of the visitor is taken' do
      let(:visitor2) { double('visitor') }

      before :each do
        position = double('position')
        expect(position).to receive(:width).and_return(4)
        expect(position).to receive(:height).and_return(4)
        expect(visitor).to(
          receive(:position).at_least(:once).and_return(position))

        expect(dimension).to receive(:width).at_least(:once).and_return(5)
        expect(dimension).to receive(:height).at_least(:once).and_return(5)
        @object = Planet.new(dimension)
      end

      it 'raises an error' do
        position2 = double('position')
        expect(position2).to receive(:width).and_return(4)
        expect(position2).to receive(:height).and_return(4)
        expect(visitor2).to(
          receive(:position).at_least(:once).and_return(position2))

        @object.landed_by(visitor2)
        expect { @object.landed_by(visitor) }.to raise_error
      end
    end

    context 'position is out of dimensions' do
      before :each do
        position = double('position')
        expect(position).to receive(:width).and_return(20)
        expect(position).to receive(:height).and_return(20)
        expect(visitor).to(
          receive(:position).at_least(:once).and_return(position))

        @object = Planet.new(double('dimension'))
      end

      it 'raises an error if the landing ' do
        expect { @object.landed_by(visitor) }.to raise_error
      end
    end
  end
end
