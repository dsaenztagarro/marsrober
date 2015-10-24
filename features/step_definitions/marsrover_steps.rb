Given(/^a plateau on Mars with dimensions "(#{CAPTURE_DIMENSIONS})"$/) do |dim|
  @planet = Planet.new(dim)
end

Given(/^NASA has a DSN station for managing communications$/) do
  @network = DSN.new
  @station = Station.new(name: 'station', network: @network)
end

Given(/^NASA deploys "(#{CAPTURE_ROBOT})" to position "(#{CAPTURE_POSITION})"$/) do |robot, position|
  @rover = Rover.new(name: robot, network: @network, planet: @planet,
                     position: position)
end

When(/^NASA sends instructions "(#{CAPTURE_INSTRUCTIONS})" to "(#{CAPTURE_ROBOT})"$/) do |str, robot|
  instructions = str.split('').map { |char| Instruction.build(char) }
  @station.notify(robot, instructions)
end

Then(/^DSN station reports the final position "(#{CAPTURE_POSITION})"$/) do |position|
  expect(@station.report).to eq(position.to_s)
end
