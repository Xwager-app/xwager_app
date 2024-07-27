import 'package:flutter/material.dart';

class WalletCard extends StatelessWidget {
  const WalletCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Wallet Balance',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
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
                      .copyWith(fontSize: 18, fontWeight: FontWeight.bold),
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
          ],
        )
      ],
    );
  }
}
