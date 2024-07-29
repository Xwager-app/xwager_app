enum Category { sports, crypto, stocks, entertainment }

enum XwagerType { head2Head, group }

enum WagerState { active, win, loss }

class Xwager {
  Xwager(
      {required this.id,
      required this.imgPath,
      required this.category,
      required this.xwagerType,
      required this.users,
      required this.wagerState,
      required this.amount});

  final int id;
  final String imgPath;
  final Category category;
  final XwagerType xwagerType;
  final List<String> users;
  final WagerState wagerState;
  final int amount;
}
