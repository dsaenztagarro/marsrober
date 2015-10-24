require 'spec_helper'

describe Instruction do
  let(:instruction) { Instruction.build(letter) }

  describe '#initialize' do
    it 'raises an error on invalid value' do
      expect { Instruction.new(0) }.to raise_error(ArgumentError)
    end
  end

  describe '#to_s' do
    [%w(L spin_left),
     %w(R spin_right),
     %w(M move_forward)].each do |char, result|
      context "when instruction is #{char}" do
        let(:letter) { char }

        it 'returns the expected string' do
          expect(instruction.to_s).to eq(result)
        end
      end
    end
  end

  describe '.build' do
    %w(LEFT RIGHT MOVE_FORWARD).each do |word|
      it "returns valid instance for character '#{word[0]}'" do
        expect(Instruction.build(word[0]).current).to(
          eq(Kernel.const_get "Instruction::#{word}"))
      end
    end

    it 'raises an error on invalid build value' do
      expect { Instruction.build('Z') }.to raise_error(ArgumentError)
    end
  end
end
