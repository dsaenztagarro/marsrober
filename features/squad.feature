Feature: Robotic rover squad motions

  Scenario: Deploy of a squad of rovers
    Given a plateau on Mars with dimensions "5 x 5"
    And NASA has a DSN station for managing communications
    And NASA deploys a squad or robotic rovers
      | RobotCode  | StartPos |
      | marsrover1 | 1 2 N    |
      | marsrover2 | 3 3 E    |
      | marsrover3 | 5 5 S    |
      | marsrover4 | 1 4 N    |
      | marsrover5 | 2 5 W    |
      | marsrover6 | 2 2 N    |
    When NASA sends instructions to the squad of rovers
      | RobotCode  | Instructions |
      | marsrover1 | LMLMLMLMM    |
      | marsrover2 | MMRMMRMRRM   |
      | marsrover3 | MMMMMMMMM    |
      | marsrover4 | MLMMMMMM     |
      | marsrover5 | MMMMMMM      |
      | marsrover6 | MMMMMMM      |
    Then it is expected to finally find robots at positions
      | RobotCode  | EndPos |
      | marsrover1 | 1 3 N  |
      | marsrover2 | 5 1 E  |
      | marsrover3 | 5 2 S  |
      | marsrover4 | 0 5 W  |
      | marsrover5 | 1 5 W  |
      | marsrover6 | 2 5 N  |


