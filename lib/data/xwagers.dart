import 'package:xwager/models/xwager.dart';

final List<Xwager> xWagers = [
  Xwager(
      id: 1,
      imgPath: 'assets/images/premier-league.png',
      category: Category.sports,
      xwagerType: XwagerType.head2Head,
      users: ['@Clarkkelvin', '@David'],
      amount: 5000,
      wagerResult: WagerResult.win),
  Xwager(
      id: 2,
      imgPath: 'assets/images/premier-league.png',
      category: Category.entertainment,
      xwagerType: XwagerType.group,
      users: ['@Daniel', '@David'],
      amount: 15000,
      wagerResult: WagerResult.win),
  Xwager(
      id: 3,
      imgPath: 'assets/images/premier-league.png',
      category: Category.sports,
      xwagerType: XwagerType.head2Head,
      users: ['@Clarkkelvin', '@David'],
      amount: 500,
      wagerResult: WagerResult.loss),
  Xwager(
      id: 4,
      imgPath: 'assets/images/premier-league.png',
      category: Category.stocks,
      xwagerType: XwagerType.head2Head,
      users: ['@Clarkkelvin', '@David'],
      amount: 3000,
      wagerResult: WagerResult.win)
];
