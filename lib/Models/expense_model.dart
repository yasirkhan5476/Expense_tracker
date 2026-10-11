class ExpenseModel {
  final String name;
  final ExpenseCategory category;
  final DateTime createdAt;
  final double expValue;

  const ExpenseModel({
    required this.name,
    required this.category,
    required this.createdAt,
    required this.expValue,
  });
}


enum ExpenseCategory{
  food,
  transport,
  health,
  shopping,
  bill,
  fun

}