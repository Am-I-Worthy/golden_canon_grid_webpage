import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final bool mobilePage;
  CustomButton({
    this.mobilePage,
  });
  @override
  _CustomButtonState createState() => _CustomButtonState();
}

double height = 0.0;
double width = 0.0;

class _CustomButtonState extends State<CustomButton>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  Animation _colorAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 1.2, end: 4.0).animate(
      CurvedAnimation(curve: Curves.linear, parent: _controller),
    );
    _colorAnimation =
        ColorTween(begin: Colors.white, end: Colors.black).animate(
      CurvedAnimation(curve: Curves.linear, parent: _controller),
    );
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          height = 200.0;
          width = 200.0;
          _controller.forward();
        });
      },
      onExit: (value) {
        setState(() {
          height = 0.0;
          width = 0.0;
          _controller.reverse();
        });
      },
      child: Container(
        height: 50.0,
        width: 160.0,
        decoration: BoxDecoration(
          color: Colors.black,
          border: Border.all(color: Colors.transparent, width: 2.0),
        ),
        clipBehavior: Clip.hardEdge,
        child: Center(
          child: Stack(
            children: [
              OverflowBox(
                maxHeight: 200.0,
                maxWidth: 200.0,
                child: AnimatedContainer(
                  curve: Curves.easeOut,
                  duration: Duration(milliseconds: 375),
                  height: height,
                  width: width,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(200.0),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.center,
                child: Text(
                  'EXPLORE',
                  style: TextStyle(
                    letterSpacing: _animation.value,
                    color: _colorAnimation.value,
                    fontWeight: FontWeight.w300,
                    fontSize: 12.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
