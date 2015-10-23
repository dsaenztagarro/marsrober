Feature: Robotic rover motions

  Scenario Outline:
    Given a plateau on Mars with dimensions "<dimensions>"
    And NASA deploys "<robot_code>" to position "<start_pos>"
    When NASA sends instructions "<instructions>" to "<robot_code>"
    Then it is expected to find "<robot_code>" at position "<end_pos>"

  Examples:
    | dimensions | code       | start_pos | instructions | end_pos |
    | 5 x 5      | marsrover1 | 1 2 N     | LMLMLMLMM    | 1 3 N   |
    | 5 x 5      | marsrover2 | 3 3 E     | MMRMMRMRRM   | 5 1 E   |
