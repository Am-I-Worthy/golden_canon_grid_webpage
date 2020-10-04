import 'package:flutter/material.dart';

class PageIndicator extends StatefulWidget {
  final Function prevButtonTap;
  final Function nextButtonTap;
  PageIndicator({
    this.prevButtonTap,
    this.nextButtonTap,
  });
  @override
  _PageIndicatorState createState() => _PageIndicatorState();
}

class _PageIndicatorState extends State<PageIndicator> {
  double preSize = 60.0;
  double nxtSize = 60.0;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      width: 380.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                widget.prevButtonTap();
              });
            },
            child: AnimatedButton('PREV'),
          ),
          Container(
            height: 1.0,
            width: 230.0,
            color: Colors.black38,
          ),
          GestureDetector(
              onTap: () {
                setState(() {
                  widget.nextButtonTap();
                });
              },
              child: AnimatedButton('NEXT')),
        ],
      ),
    );
  }
}

class AnimatedButton extends StatefulWidget {
  final String text;
  AnimatedButton(this.text);
  @override
  _AnimatedButtonState createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton>
    with SingleTickerProviderStateMixin {
  double size = 60.0;
  Color color = Colors.transparent;
  AnimationController _controller;
  Animation<double> _animation;

  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300),
    );
    _animation = Tween<double>(begin: 0.0, end: 2.0).animate(
      CurvedAnimation(curve: Curves.linear, parent: _controller),
    );
    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.0,
      width: 70.0,
      child: Center(
        child: MouseRegion(
          onEnter: (value) {
            setState(() {
              size = 70.0;
              color = Colors.black;
              _controller.forward();
            });
          },
          onExit: (value) {
            setState(() {
              size = 60.0;
              color = Colors.transparent;
              _controller.reverse();
            });
          },
          child: AnimatedContainer(
            duration: Duration(milliseconds: 300),
            height: size,
            width: size,
            decoration: BoxDecoration(
              border: Border.all(color: color, width: 0.5),
              borderRadius: BorderRadius.circular(40.0),
            ),
            child: Center(
              child: Text(
                widget.text,
                style: TextStyle(
                  fontSize: 11.0,
                  letterSpacing: _animation.value,
                  color: Colors.black54,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
