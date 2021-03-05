class User {
  final String name;
  final String? photo;
  final int level;
  final int points;
  final int completedChallenges;
  final int totalChallenges;

  User({
    required this.name,
    this.level = 0,
    this.points = 0,
    this.photo,
    this.completedChallenges = 0,
    this.totalChallenges = 0,
  });
}
