class RecommendedTripModel {
  final String title;
  final String imagePath;
  final int costPerPerson;
  final DateTime startDateTime;
  final DateTime endDateTime;

  RecommendedTripModel({
    required this.title,
    required this.imagePath,
    required this.costPerPerson,
    required this.startDateTime,
    required this.endDateTime,
  });
}
