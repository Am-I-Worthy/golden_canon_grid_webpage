import 'package:flutter/material.dart';

class NavBar extends StatefulWidget {
  final bool mobilePage;
  NavBar({
    this.mobilePage,
  });
  @override
  _NavBarState createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      width: 400.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: widget.mobilePage
            ? [
                SizedBox(
                  width: 280.0,
                ),
                Icon(Icons.drag_handle),
              ]
            : [
                NavBarItem('HOME',true),
                NavBarItem('REVIEW',false),
                NavBarItem('SEARCH',false),
                Icon(Icons.drag_handle),
              ],
      ),
    );
  }
}

class NavBarItem extends StatefulWidget {
  final String text;
  final bool selected;
  NavBarItem(this.text,this.selected);
  @override
  _NavBarItemState createState() => _NavBarItemState();
}

class _NavBarItemState extends State<NavBarItem> {
  double height = 3.0;
  double width = 0.0;
  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (value) {
        setState(() {
          width = 40.0;
        });
      },
      onExit: (value) {
        setState(() {
          width = 0.0;
        });
      },
      child: Container(
        height: 23.0,
        width: 45.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AnimatedContainer(
              margin: EdgeInsets.only(bottom: 8.0),
              duration: Duration(milliseconds: 200),
              curve: Curves.easeOut,
              height: height,
              width: widget.selected ? 40.0 : width,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            Text(
              widget.text,
              style: TextStyle(fontSize: 9.5,color: widget.selected ? Colors.black : Colors.black45,),
            )
          ],
        ),
      ),
    );
  }
}
