require 'spec_helper'

describe Orientation do
  let(:orientation) { Orientation.build(letter) }

  describe '#initialize' do
    it 'raises an error on invalid value' do
      expect { Orientation.new(0) }.to raise_error(ArgumentError)
    end
  end

  describe '#spin_left' do
    context 'when NORTH' do
      let(:letter) { 'N' }

      it 'spins to the left with success' do
        orientation.spin_left
        expect(orientation.current).to eq(Orientation::WEST)
      end
    end

    context 'when EAST' do
      let(:letter) { 'E' }

      it 'spins to the left with success' do
        orientation.spin_left
        expect(orientation.current).to eq(Orientation::NORTH)
      end
    end

    context 'when SOUTH' do
      let(:letter) { 'S' }

      it 'spins to the left with success' do
        orientation.spin_left
        expect(orientation.current).to eq(Orientation::EAST)
      end
    end

    context 'when WEST' do
      let(:letter) { 'W' }
      it 'spins to the left with success' do
        orientation.spin_left
        expect(orientation.current).to eq(Orientation::SOUTH)
      end
    end
  end

  describe '#spin_right' do
    context 'when NORTH' do
      let(:letter) { 'N' }

      it 'spins to the right with success' do
        orientation.spin_right
        expect(orientation.current).to eq(Orientation::EAST)
      end
    end

    context 'when EAST' do
      let(:letter) { 'E' }

      it 'spins to the right with success' do
        orientation.spin_right
        expect(orientation.current).to eq(Orientation::SOUTH)
      end
    end

    context 'when SOUTH' do
      let(:letter) { 'S' }

      it 'spins to the right with success' do
        orientation.spin_right
        expect(orientation.current).to eq(Orientation::WEST)
      end
    end

    context 'when WEST' do
      let(:letter) { 'W' }

      it 'spins to the right with success' do
        orientation.spin_right
        expect(orientation.current).to eq(Orientation::NORTH)
      end
    end
  end

  ORIENTATION_WORDS = %w(NORTH EAST SOUTH WEST)
  ORIENTATION_CHARS = %w(N E S W)
  ORIENTATION_VALUES = (1..4).to_a

  describe '#to_s' do
    ORIENTATION_WORDS.each_with_index do |word, index|
      context "when #{word}" do
        let(:letter) { ORIENTATION_CHARS[index] }

        it 'returns the expected string' do
          expect(orientation.to_s).to eq(word.downcase)
        end
      end
    end
  end

  describe '#to_char' do
    ORIENTATION_VALUES.each_with_index do |value, index|
      context "when #{value}" do
        let(:orientation) { Orientation.new(value) }

        it 'returns the expected character' do
          expect(orientation.to_char).to eq(ORIENTATION_CHARS[index])
        end
      end
    end
  end

  describe '.build' do
    ORIENTATION_WORDS.each_with_index do |word, index|
      it "returns valid instance for character '#{ORIENTATION_CHARS[index]}'" do
        expect(Orientation.build(word[0]).current).to(
          eq(Kernel.const_get "Orientation::#{word}"))
      end
    end
  end
end
