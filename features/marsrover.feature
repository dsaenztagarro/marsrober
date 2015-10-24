Feature: Robotic rover motions

  Scenario Outline:
    Given a plateau on Mars with dimensions "<Dimensions>"
    And NASA has a Deep Space Network (DSN) station for managing communications
    And NASA deploys "<RobotCode>" to position "<StartPos>"
    When NASA sends instructions "<Instructions>" to "<RobotCode>"
    Then it is expected to find "<RobotCode>" at position "<EndPos>"

  Examples:
    | Dimensions | RobotCode  | StartPos | Instructions | EndPos |
    | 5 x 5      | marsrover1 | 1 2 N    | LMLMLMLMM    | 1 3 N  |
    | 5 x 5      | marsrover2 | 3 3 E    | MMRMMRMRRM   | 5 1 E  |
