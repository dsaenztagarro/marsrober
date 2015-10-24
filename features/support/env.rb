require 'simplecov'
SimpleCov.command_name 'test:integration'

# Load lib folder
require_relative '../step_definitions/transforms'
Dir[File.dirname(__FILE__) + '/../../lib/**/*.rb'].each { |file| require file }
