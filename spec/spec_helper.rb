require 'pry-byebug'
require 'simplecov'
SimpleCov.command_name 'test:units'

# Load lib folder
Dir[File.dirname(__FILE__) + '/../lib/**/*.rb'].each { |file| require file }

shared_examples_for 'is_connectable' do
  it 'responds to notify' do
    expect(@object).to respond_to(:notify).with(2).arguments
  end

  it 'responds to listen' do
    expect(@object).to respond_to(:listen).with(1).argument
  end
end
