class CustomDuration {
  final int _millisec;

  CustomDuration._(this._millisec);

  factory CustomDuration.fromHours(int hours) => CustomDuration._(hours * 3600000); 
  factory CustomDuration.frommin(int min) => CustomDuration._(min * 60000);
  factory CustomDuration.fromsec(int sec) => CustomDuration._(sec * 1000);

  int get millisec => _millisec;

  @override
  String toString() {
    int sec = _millisec ~/ 1000;
    int min = sec ~/ 60;
    sec %= 60;
    int hours = min ~/ 60;
    min %= 60;
    return '$hours hours, $min min, $sec sec';
  }

  int compareTo(CustomDuration other) => _millisec.compareTo(other._millisec);

  CustomDuration operator +(CustomDuration other) => CustomDuration._(_millisec + other._millisec);

  CustomDuration operator -(CustomDuration other) {
    final diff = _millisec - other._millisec;
    if (diff < 0) {
      throw Exception("Cannot create a negative duration.");
    }
    return CustomDuration._(diff);
  }
}

void main() {
  CustomDuration dur1 = CustomDuration.fromHours(3); //hours
  CustomDuration dur2 = CustomDuration.frommin(45); //min

  print(dur1 + dur2); // 3 hours, 45 min, 0 sec
  //print(dur1 > dur2); // true

  try {
    print(dur2 - dur1);
  } catch (e) {
    print(e);
  }
}