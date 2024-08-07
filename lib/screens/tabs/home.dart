import 'package:flutter/material.dart';
import 'package:xwager/widgets/home/home_button_list.dart';
import 'package:xwager/widgets/home/home_header.dart';
import 'package:xwager/widgets/home/new_wager_button.dart';
import 'package:xwager/widgets/home/positioned_card.dart';
import 'package:xwager/widgets/home/recent_wager.dart';
import 'package:xwager/widgets/home/wallet_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;

    double safeAreaTopPadding = MediaQuery.of(context).padding.top;
    double safeAreaBottomPadding = MediaQuery.of(context).padding.bottom;

    return Container(
      color: const Color.fromRGBO(198, 229, 255, 1),
      padding: EdgeInsets.only(top: safeAreaTopPadding),
      child: Container(
        color: Colors.white,
        child: Stack(
          children: [
            SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                    minHeight: deviceHeight -
                        safeAreaTopPadding -
                        safeAreaBottomPadding),
                child: Column(
                  children: [
                    SizedBox(
                      child: Stack(clipBehavior: Clip.none, children: [
                        Container(
                          width: double.infinity,
                          height: 240,
                          decoration: const BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white,
                                blurRadius: 20,
                              )
                            ],
                            color: Color.fromRGBO(198, 229, 255, 1),
                            borderRadius: BorderRadiusDirectional.only(
                              bottomStart: Radius.circular(60),
                              bottomEnd: Radius.circular(60),
                            ),
                          ),
                          padding: const EdgeInsets.only(
                              top: 10, left: 10, right: 10),
                          child: const Column(
                            children: [HomeHeader()],
                          ),
                        ),
                        const PositionedCard(bottom: -40, left: 40, right: 40),
                        const PositionedCard(bottom: -50, left: 30, right: 30),
                        PositionedCard(
                          bottom: -60,
                          left: 20,
                          right: 20,
                          containerColor:
                              Theme.of(context).colorScheme.onPrimary,
                          containerPadding: const EdgeInsets.all(20),
                          innerItem: const WalletCard(),
                        ),
                      ]),
                    ),
                    const SizedBox(
                      height: 90,
                    ),
                    const HomeButtonList(),
                    const SizedBox(
                      height: 30,
                    ),
                    const RecentWagers()
                  ],
                ),
              ),
            ),
            const NewWagerButton()
          ],
        ),
      ),
    );
  }
}
