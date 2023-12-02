class WeightItem {
  String? id;
  String dateTime;
  double weight;
  String userId;

  WeightItem({
    this.id,
    String? dateTime,
    required this.weight,
    required this.userId,
  }) : dateTime = dateTime ?? DateTime.now().toString();

  @override
  String toString() {
    return 'Weight Item - ID: $id, Date Time: $dateTime, Weight: $weight, User ID: $userId';
  }
}
