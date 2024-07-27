import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;

    double safeAreaTopPadding = MediaQuery.of(context).padding.top;
    double safeAreaBottomPadding = MediaQuery.of(context).padding.bottom;

    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: ConstrainedBox(
          constraints: BoxConstraints(
              minHeight:
                  deviceHeight - safeAreaTopPadding - safeAreaBottomPadding),
          child: Column(
            children: [
              Center(
                child: Stack(clipBehavior: Clip.none, children: [
                  Container(
                    width: double.infinity,
                    height: 300,
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
                    padding: EdgeInsets.only(
                        top: safeAreaTopPadding + 10, left: 20, right: 20),
                    child: Column(
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  clipBehavior: Clip.hardEdge,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          width: 2),
                                      borderRadius: BorderRadius.circular(100)),
                                  child: Image.asset(
                                    'assets/images/user.png',
                                    scale: 0.2,
                                    width: 38,
                                    height: 38,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  'Heyyo, @Clarkkelvin',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium!
                                      .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onPrimary,
                                          fontSize: 16),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.verified,
                                  color:
                                      Theme.of(context).colorScheme.onPrimary,
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  visualDensity: VisualDensity.compact,
                                  icon: Icon(
                                    Icons.notifications_none,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  visualDensity: VisualDensity.compact,
                                  icon: Icon(
                                    Icons.more_horiz,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: -40,
                    left: 40,
                    right: 40,
                    child: Center(
                      child: Container(
                        width: double.infinity,
                        height: 190,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 10,
                            ),
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 10,
                            )
                          ],
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -50,
                    left: 30,
                    right: 30,
                    child: Center(
                      child: Container(
                        width: double.infinity,
                        height: 190,
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 10,
                            ),
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 10,
                            )
                          ],
                          borderRadius: BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -60,
                    left: 20,
                    right: 20,
                    child: Center(
                      child: Container(
                        width: double.infinity,
                        height: 190,
                        padding: const EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.onPrimary,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black,
                              blurRadius: 10,
                            ),
                            BoxShadow(
                              color: Colors.white,
                              blurRadius: 10,
                            )
                          ],
                          borderRadius: const BorderRadius.all(
                            Radius.circular(10),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Wallet Balance',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyLarge!
                                    .copyWith(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      'assets/images/logo-2.png',
                                      width: 90,
                                      height: 40,
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      '\$ 40,768.90',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Column(
                                    children: [
                                      Image.asset(
                                        'assets/images/add-fund.png',
                                        width: 50,
                                        height: 50,
                                      ),
                                      const SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Fund Wallet',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium!
                                            .copyWith(fontSize: 10),
                                      )
                                    ],
                                  ),
                                )
                                // Inkw(
                                //   icon: Image.asset(
                                //     'assets/images/add-fund.png',
                                //     width: 50,
                                //     height: 50,
                                //   ),
                                //   onPressed: () {},
                                // )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
