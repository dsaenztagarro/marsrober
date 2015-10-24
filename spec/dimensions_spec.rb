require 'spec_helper'

describe Dimensions do
  before :each do
    @obj = described_class.new(5, 5)
  end

  it 'responds to width' do
    expect(@obj).to respond_to(:width)
  end

  it 'responds to height' do
    expect(@obj).to respond_to(:height)
  end
end
