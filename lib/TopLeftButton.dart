import 'package:flutter/material.dart';
import 'package:golden_canon_grid_webpage/src/MobilePage.dart';
import 'package:golden_canon_grid_webpage/src/WebPage.dart';

class TopLeftButton extends StatefulWidget {
  final bool mobilePage;
  TopLeftButton({this.mobilePage});
  @override
  _TopLeftButtonState createState() => _TopLeftButtonState();
}

class _TopLeftButtonState extends State<TopLeftButton> {
  double height1 = 15.0;
  double width1 = 15.0;
  double height2 = 8.0;
  double width2 = 8.0;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          height1 = 8.0;
          width1 = 8.0;
          height2 = 15.0;
          width2 = 15.0;
        });
      },
      onExit: (value) {
        setState(() {
          height1 = 15.0;
          width1 = 15.0;
          height2 = 8.0;
          width2 = 8.0;
        });
      },
      child: Container(
        height: widget.mobilePage ? MobilePage.tlbContainerheight : WebPage.tlbContainerheight,
        width: widget.mobilePage ? MobilePage.tlbContainerWidth : WebPage.tlbContainerWidth,
        color: Colors.white,
        child: Stack(
          children: [
            Positioned(
              top: widget.mobilePage ? MobilePage.tlbContainer1Top : WebPage.tlbContainer1Top,
              left: widget.mobilePage ? MobilePage.tlbContainer1Left : WebPage.tlbContainer1Left,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeOut,
                height: height2,
                width: width2,
                color: Colors.black,
                transform: Matrix4.identity()..rotateZ(2.4),
              ),
            ),
            Positioned(
              top: widget.mobilePage ? MobilePage.tlbContainer2Top : WebPage.tlbContainer2Top,
              left: widget.mobilePage ? MobilePage.tlbContainer2Left : WebPage.tlbContainer2Left,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                curve: Curves.easeOut,
                height: height1,
                width: width1,
                color: Colors.black,
                transform: Matrix4.identity()..rotateZ(-0.8),
              ),
            ),
            Positioned(
              top: widget.mobilePage ? MobilePage.tlbContainer3Top : WebPage.tlbContainer3Top,
              left: widget.mobilePage ? MobilePage.tlbContainer3Left : WebPage.tlbContainer3Left,
              child: Container(
                height: 3.0,
                width: 3.0,
                color: Colors.white,
                transform: Matrix4.identity()..rotateZ(0.8),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
