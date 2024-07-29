import 'package:flutter/material.dart';

class NewWagerButton extends StatefulWidget {
  const NewWagerButton({super.key});

  @override
  State<StatefulWidget> createState() {
    return _NewWagerButtonState();
  }
}

class _NewWagerButtonState extends State<NewWagerButton>
    with SingleTickerProviderStateMixin {
// the late tells dart that this variable does not have a value at the beginning but will have a value when being used.
  late AnimationController _animationController;
  bool _isVisible = true;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500),
        lowerBound: 0,
        upperBound: 1)
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            _isVisible = false;
          });
        }
      });

    _startAnimationWithDelay();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  void _startAnimationWithDelay() async {
    await Future.delayed(const Duration(seconds: 3));
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      // top: deviceHeight - 130,
      bottom: 20,
      right: 10,
      child: InkWell(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                color: Colors.black,
                blurRadius: 5,
              ),
              BoxShadow(
                color: Colors.white,
                blurRadius: 10,
              )
            ],
            color: Theme.of(context).colorScheme.onPrimary,
            borderRadius: BorderRadius.circular(40),
          ),
          child: Row(children: [
            _isVisible
                ? AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) => FadeTransition(
                        opacity: Tween<double>(
                          begin: 1.0,
                          end: 0.0,
                        ).animate(
                          CurvedAnimation(
                            parent: _animationController,
                            curve: Curves.easeInOut,
                          ),
                        ),
                        child: child),
                    child: Text(
                      'New Wager',
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                : Container(),
            SizedBox(
              width: _isVisible ? 10 : 0,
            ),
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Center(
                child: Image.asset(
                  'assets/images/wager.png',
                ),
              ),
            ),
          ]),
        ),
      ),
    );
  }
}
