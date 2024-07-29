import 'package:flutter/material.dart';
import 'package:xwager/data/home_buttons.dart';

class HomeButtonList extends StatelessWidget {
  const HomeButtonList({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          for (final button in homeButtons)
            Expanded(
              child: InkWell(
                onTap: () {
                  button.navigate(context);
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .onSecondaryContainer,
                          border: Border.all(
                              color: Theme.of(context).colorScheme.onPrimary,
                              width: 4),
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: button.icon,
                        )),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      button.text1,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      button.text2,
                      softWrap: true,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
              ),
            )
        ],
      ),
    );
  }
}
