void main() {
// The list of student's score
List<int> scores = [45, 78, 62, 49, 85, 33, 90, 50];
// where function to filter the list
List<int> passed = scores.where((score) => score >= 50).toList();
// Print who passes
print(passed);
print('${passed.length} students passed');
}