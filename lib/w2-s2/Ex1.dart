enum Skill { flutter, dart, php }

class Address {
  final String street;
  final String city;
  final String zipCode;

  const Address({required this.street, required this.city, required this.zipCode});
}

class Employee {
  final String name;
  final double baseSalary;
  final List<Skill> skills;
  final Address address;
  final int yearsOfExp;

  const Employee({
    required this.name,
    required this.baseSalary,
    required this.skills,
    required this.address,
    required this.yearsOfExp,
  });

  // Named constructors for specific employee types (e.g., mobile developer)
  Employee.mobileDeveloper({
    required String name,
    required double baseSalary,
    required Address address,
    int yearsOfExp = 0,
  }) : this(
          name: name,
          baseSalary: baseSalary,
          skills: [Skill.flutter, Skill.dart, Skill.php],
          address: address,
          yearsOfExp: yearsOfExp,
        );

  // Getter
  String get getName => name;
  double get getBaseSalary => baseSalary;
  List<Skill> get getSkills => skills;
  Address get getAddress => address;
  int get getYearsOfExp => yearsOfExp;

  // Method
  double computeSalary() {
    double salary = baseSalary + (yearsOfExp * 2000);
    for (final skill in skills) {
      switch (skill) {
        case Skill.flutter:
          salary += 5000;
          break;
        case Skill.dart:
          salary += 3000;
          break;
        case Skill.php:
          salary += 1000;
          break;
      }
    }
    return salary;
  }
  // print
  void printDetails() {
    print('Employee: $name');
    print('  Base Salary: \$${baseSalary}');
    print('  Skills: ${skills.join(', ')}'); 
    print('  Address:');
    print('    Street: ${address.street}');
    print('    City: ${address.city}');
    print('    Zip Code: ${address.zipCode}');
    print('  Years of Experience: $yearsOfExp');
    print('  Salary: \$${computeSalary()}'); 
  }
}
void main() {
  const address1 = Address(street: "Norodom", city: "Phnom Penh", zipCode: "12001");
  var employee1 = Employee.mobileDeveloper(
    name: "Oem Pimol",
    baseSalary: 5000,
    address: address1,
    yearsOfExp: 3,
  );
  employee1.printDetails();
}