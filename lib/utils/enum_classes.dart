enum AgeRange {
  group18To24,
  group25To39,
  group40To59,
  group60plus;

  static AgeRange fromString(String age) {
    switch (age) {
      case '18-24 yrs':
        return AgeRange.group18To24;
      case '25-39 yrs':
        return AgeRange.group25To39;
      case '40-59 yrs':
        return AgeRange.group40To59;
      case '60+ yrs':
        return AgeRange.group60plus;
      default:
        return AgeRange.group18To24;
    }
  }

  @override
  String toString() {
    switch (this) {
      case AgeRange.group18To24:
        return '18-24 yrs';
      case AgeRange.group25To39:
        return '25-39 yrs';
      case AgeRange.group40To59:
        return '40-59 yrs';
      case AgeRange.group60plus:
        return '60+ yrs';
    }
  }
}

enum Gender {
  male,
  female,
  nonBinary,
  preferNotToSay;

  static Gender fromString(String gender) {
    switch (gender) {
      case 'Male':
        return Gender.male;
      case 'Female':
        return Gender.female;
      case 'Non-Binary':
        return Gender.nonBinary;
      case 'Prefer not to say':
        return Gender.preferNotToSay;
      default:
        return Gender.male;
    }
  }

  @override
  String toString() {
    switch (this) {
      case Gender.male:
        return 'Male';
      case Gender.female:
        return 'Female';
      case Gender.nonBinary:
        return 'Non-Binary';
      case Gender.preferNotToSay:
        return 'Prefer not to say';
    }
  }
}

enum TravellerType {
  solo,
  group,
  couple,
  family,
  business;

  static TravellerType fromString(String type) {
    switch (type) {
      case 'Solo':
        return TravellerType.solo;
      case 'Group':
        return TravellerType.group;
      case 'Couple':
        return TravellerType.couple;
      case 'Family':
        return TravellerType.family;
      case 'Business':
        return TravellerType.business;
      default:
        return TravellerType.solo;
    }
  }

  @override
  String toString() {
    switch (this) {
      case TravellerType.solo:
        return 'Solo';
      case TravellerType.group:
        return 'Group';
      case TravellerType.couple:
        return 'Couple';
      case TravellerType.family:
        return 'Family';
      case TravellerType.business:
        return 'Business';
    }
  }
}
