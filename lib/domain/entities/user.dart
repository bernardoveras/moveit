class User {
  final String name;
  final String? photo;
  int level;
  int points;
  int completedChallenges;
  int totalChallenges;

  User({
    required this.name,
    this.photo,
    this.level = 0,
    this.points = 0,
    this.completedChallenges = 0,
    this.totalChallenges = 0,
  });
}
