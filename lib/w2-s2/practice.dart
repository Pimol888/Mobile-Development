// Build your house
enum Houses { Door, Window, Floor, Roof, Room }

class House {
  //final List<Window> windows = [];
  final String roof;
  final int window;
  final int door;
  final int floor;
  
  var room;

 // get windowNumber => windows.length;
  
   //Constractor
  House(
{     required this.room,
      required this.roof,
      required this.window,
      required this.door,
      required this.floor});
}

class roof {
  String type;
  int amount;

  roof(this.amount, this.type);
}

class room {
  String type;
  int amount;
  room(this.amount, this.type);
}

class window {
  String color;
  int amount;
  window(this.amount, this.color);
}

class door {
  String type;
  int amount;
  door(this.amount, this.type);
}

class floor {
  int amount;
  floor(this.amount);
}

// Method
// void Details() {
//   print('House has:');
//   print('Room: $room');
//   print('Roof: $roof');
//   print('Number of windows: $window');
//   print('Number of doors: $door');
//   print('Number of floors: $floor');
// }

// void main() {
//   // Create a house with the number of windows, doors, etc.
//   House myHouse = House(
//     room: 'Living Room',
//     roof: 'Concrete Roof',
//     window: 4,
//     door: 2,
//     floor: 2,
//   );

//   // Display the house details
//   myHouse.Details();
// }