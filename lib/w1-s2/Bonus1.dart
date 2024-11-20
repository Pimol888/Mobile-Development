enum Direction { north, east, south, west }

class Robot {
  int x = 0;
  int y = 0;
  Direction direction = Direction.north;

  void turnRight() {
    switch (direction) {
      case Direction.north:
        direction = Direction.east;
        break;
      case Direction.east:
        direction = Direction.south;
        break;
      case Direction.south:
        direction = Direction.west;
        break;
      case Direction.west:
        direction = Direction.north;
        break;
    }
  }

  void turnLeft() {
    switch (direction) {
      case Direction.north:
        direction = Direction.west;
        break;
      case Direction.east:
        direction = Direction.north;
        break;
      case Direction.south:
        direction = Direction.east;
        break;
      case Direction.west:
        direction = Direction.south;
        break;
    }
  }

  void advance() {
    switch (direction) {
      case Direction.north:
        y++;
        break;
      case Direction.east:
        x++;
        break;
      case Direction.south:
        y--;
        break;
      case Direction.west:
        x--;
        break;
    }
  }

  void executeInstructions(String instructions) {
    for (final char in instructions.split('')) {
      switch (char) {
        case 'R':
          turnRight();
          break;
        case 'L':
          turnLeft();
          break;
        case 'A':
          advance();
          break;
      }
    }
  }
}
void main() {
  final robot = Robot();
  robot.executeInstructions("RAALAL");
  print('Final position: (${robot.x}, ${robot.y}), facing ${robot.direction}');
}