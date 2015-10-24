require 'spec_helper'

describe Position do
  let(:orientation) { double('orientation') }
  let(:instruction) { double('instruction') }

  before :each do
    @obj = Position.new(1, 1, orientation)
  end

  describe '#to_s' do
    before :each do
      expect(orientation).to receive(:to_char).and_return('N')
    end

    it 'returns the string representation successfully' do
      expect(@obj.to_s).to eq('1 1 N')
    end
  end

  describe '#apply' do
    %w(left right).each do |direction|
      context "when instruction spin #{direction}" do
        it 'applies successfully instruction' do
          method = "spin_#{direction}"
          expect(instruction).to receive(:to_s).and_return(method)
          expect(orientation).to receive(method.to_sym)
          @obj.apply(instruction)
        end
      end
    end

    context 'when instruction move forward NORTH' do
      it 'applies successfully instruction' do
        expect(orientation).to receive('to_s').and_return('north')
        expect(instruction).to receive('to_s').and_return('move_forward')
        @obj.apply(instruction)
        expect(@obj.height).to eq(2)
      end
    end

    it 'applies successfully instruction to move forward NORTH' do
      expect(orientation).to receive('to_s').and_return('north')
      expect(instruction).to receive('to_s').and_return('move_forward')
      @obj.apply(instruction)
      expect(@obj.height).to eq(2)
    end

    it 'applies successfully instruction to move forward SOUTH' do
      expect(orientation).to receive('to_s').and_return('south')
      expect(instruction).to receive('to_s').and_return('move_forward')
      @obj.apply(instruction)
      expect(@obj.height).to eq(0)
    end

    it 'applies successfully instruction to move forward WEST' do
      expect(orientation).to receive('to_s').and_return('west')
      expect(instruction).to receive('to_s').and_return('move_forward')
      @obj.apply(instruction)
      expect(@obj.width).to eq(0)
    end

    it 'applies successfully instruction to move forward EAST' do
      expect(orientation).to receive('to_s').and_return('east')
      expect(instruction).to receive('to_s').and_return('move_forward')
      @obj.apply(instruction)
      expect(@obj.width).to eq(2)
    end
  end

  describe '.zero' do
    it 'returns a new position at origen' do
      position = Position.zero
      expect(position.width).to eq(0)
      expect(position.height).to eq(0)
    end
  end
end
