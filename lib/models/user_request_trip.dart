import 'dart:convert';

class UserRequestTrip {
  final String homeCity;
  final String destination;
  final String startDate;
  final String endDate;
  final String description;
  final int budget;
  final int people;

  UserRequestTrip({
    required this.homeCity,
    required this.destination,
    required this.startDate,
    required this.endDate,
    required this.description,
    required this.budget,
    required this.people,
  });

  UserRequestTrip copyWith({
    String? userId,
    String? homeCity,
    String? destination,
    String? startDate,
    String? endDate,
    String? description,
    int? budget,
    int? people,
  }) {
    return UserRequestTrip(
      homeCity: homeCity ?? this.homeCity,
      destination: destination ?? this.destination,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      description: description ?? this.description,
      budget: budget ?? this.budget,
      people: people ?? this.people,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'home_city': homeCity,
      'destination': destination,
      'start_date': startDate,
      'end_date': endDate,
      'description': description,
      'budget': budget,
      'people': people,
    };
  }

  factory UserRequestTrip.fromMap(Map<String, dynamic> map) {
    return UserRequestTrip(
      homeCity: map['home_city'] ?? '',
      destination: map['destination'] ?? '',
      startDate: map['start_date'] ?? '',
      endDate: map['end_date'] ?? '',
      description: map['description'] ?? '',
      budget: map['budget'] ?? 0,
      people: map['people'] ?? 0,
    );
  }

  String toJson() => json.encode(toMap());

  factory UserRequestTrip.fromJson(String source) =>
      UserRequestTrip.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserRequestTrip(, destination: $destination, startDate: $startDate, endDate: $endDate, description: $description, budget: $budget, people: $people)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserRequestTrip &&
        other.destination == destination &&
        other.startDate == startDate &&
        other.endDate == endDate &&
        other.description == description &&
        other.budget == budget &&
        other.people == people;
  }

  @override
  int get hashCode {
    return destination.hashCode ^
        startDate.hashCode ^
        endDate.hashCode ^
        description.hashCode ^
        budget.hashCode ^
        people.hashCode;
  }
}
