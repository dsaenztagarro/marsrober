Given(/^NASA deploys a squad or robotic rovers$/) do |table|
  @rovers = table.hashes.map do |rover|
    regexpos = /^(?<width>\d+) (?<height>\d+) (?<orientation>[NSEW])$/
    matchdata = regexpos.match(rover[:StartPos])
    position = Position.new(matchdata[:width].to_i,
                            matchdata[:height].to_i,
                            Orientation.build(matchdata[:orientation]))
    Rover.new(name: rover[:RobotCode], network: @network, planet: @planet,
              position: position)
  end
end

When(/^NASA sends instructions to the squad of rovers$/) do |table|
  table.hashes.map do |data|
    cmd = data[:Instructions].split('').map { |char| Instruction.build(char) }
    @station.notify(data[:RobotCode], cmd)
  end
end

Then(/^it is expected to finally find robots at positions$/) do |table|
  @station.report.split("\n").zip(table.hashes).each do |station_pos, data|
    expect(station_pos).to eq(data[:EndPos])
  end
end
