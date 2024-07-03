import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:xwager/data/welcome_messages.dart';

class CarouselScreen extends StatefulWidget {
  const CarouselScreen({super.key});

  @override
  State<CarouselScreen> createState() => _CarouselScreenState();
}

class _CarouselScreenState extends State<CarouselScreen> {
  final CarouselController buttonCarouselController = CarouselController();

  var _activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
          carouselController: buttonCarouselController,
          options: CarouselOptions(
            onPageChanged: (index, reason) => {
              setState(() {
                _activeIndex = index;
              })
            },
            autoPlay: true,
            height: 180,
            padEnds: false,
            viewportFraction: 1,
          ),
          items: messages.map((item) {
            return Builder(
              builder: (BuildContext context) {
                return SizedBox(
                  // width: deviceWidth * 0.7, // Set width to 50% of the device width
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        textAlign: TextAlign.left,
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(fontSize: 32, color: Colors.white),
                      ),
                      Text(item.text,
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: Colors.white, fontSize: 16)),
                      // const SizedBox(
                      //   height: 35,
                      // ),
                    ],
                  ),
                );
              },
            );
          }).toList(),
        ),
        Row(
          children: [
            for (final (i, _) in messages.indexed)
              Container(
                width: i == _activeIndex ? 20 : 15,
                height: i == _activeIndex ? 20 : 15,
                margin: const EdgeInsets.only(right: 20),
                decoration: BoxDecoration(
                    color:
                        i == _activeIndex ? Colors.white : Colors.transparent,
                    border: Border.all(color: Colors.white, width: 1),
                    borderRadius: BorderRadius.circular(50)),
              )
          ],
        ),
      ],
    );
  }
}
