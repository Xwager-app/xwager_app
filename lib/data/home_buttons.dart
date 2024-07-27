import 'package:flutter/material.dart';
import 'package:xwager/models/home_button.dart';
import 'package:xwager/screens/board_weekly_prize.dart';
import 'package:xwager/screens/fpl_contests.dart';
import 'package:xwager/screens/market_place.dart';

void navigateToMarketPlace(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (ctx) => const MarketPlaceScreen()),
  );
}

void navigateToFPLContest(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (ctx) => const FPLContestScreen()),
  );
}

void navigateToBoardWeeklyPrizes(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (ctx) => const BoardWeeklyPrizesScreen()),
  );
}

final List<HomeButton> homeButtons = [
  HomeButton(
      icon: Image.asset(
        'assets/images/wager.png',
        height: 24,
        width: 24,
      ),
      text1: "The Xwager",
      text2: "Marketplace",
      navigateToScreen: navigateToMarketPlace),
  HomeButton(
      icon: Image.asset(
        'assets/images/premier-league.png',
        height: 24,
        width: 24,
      ),
      text1: 'FPL',
      text2: 'Contests',
      navigateToScreen: navigateToFPLContest),
  HomeButton(
      icon: Image.asset(
        'assets/images/currency.png',
        height: 24,
        width: 24,
      ),
      text1: 'Board-Weekly',
      text2: "Prizes",
      navigateToScreen: navigateToBoardWeeklyPrizes),
  HomeButton(
      icon: Image.asset(
        'assets/images/youtube.png',
        height: 24,
        width: 24,
      ),
      text1: 'Watch',
      text2: 'Tutorials',
      navigateToScreen: (BuildContext context) {}),
];
