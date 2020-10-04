import 'dart:math';

import 'package:flutter/material.dart';
import 'package:golden_canon_grid_webpage/CustomButton.dart';
import 'package:golden_canon_grid_webpage/NavBar.dart';
import 'package:golden_canon_grid_webpage/PageIndicator.dart';
import 'package:golden_canon_grid_webpage/TopLeftButton.dart';
import 'package:golden_canon_grid_webpage/src/MobilePage.dart';
import 'package:golden_canon_grid_webpage/src/WebPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
    );
  }
}

List<String> images = [
  'https://images.unsplash.com/photo-1546555648-fb7876c40c58?ixlib=rb-1.2.1&auto=format&fit=crop&w=1055&q=80',
  'https://images.unsplash.com/photo-1554995207-c18c203602cb?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
  'https://images.unsplash.com/photo-1560185008-186576e0f1e2?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
  'https://images.unsplash.com/photo-1560448204-61dc36dc98c8?ixlib=rb-1.2.1&auto=format&fit=crop&w=1050&q=80',
];

List<Color> colors = [
  Colors.yellow[300],
  Colors.blue[300],
  Colors.grey[300],
  Colors.green[300]
];

bool mobilePage = false;

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  PageController _pageController;
  PageController _colorController;
  void initState() {
    super.initState();
    _pageController = PageController();
    _colorController = PageController();
  }

  int index = 0;
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        child: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 600) {
                mobilePage = true;
              } else {
                mobilePage = false;
              }
              return Stack(
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Transform.rotate(
                      angle: pi,
                      child: Container(
                        height: mobilePage
                            ? height * MobilePage.backgroundColorHeightFactor
                            : height * WebPage.backgroundColorHeightFactor,
                        width: mobilePage
                            ? height * MobilePage.backgroundColorWidthFactor
                            : width * WebPage.backgroundColorWidthFactor,
                        child: PageView(
                          scrollDirection: Axis.vertical,
                          controller: _colorController,
                          children: colors
                              .map(
                                (e) => Container(
                                  color: e,
                                ),
                              )
                              .toList(),
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment:
                        mobilePage ? MobilePage.imageAlign : WebPage.imageAlign,
                    child: Container(
                      height: mobilePage
                          ? height * MobilePage.imageHeightFactor
                          : height * WebPage.imageHeightFactor,
                      width: mobilePage
                          ? width * MobilePage.imageWidthFactor
                          : width * WebPage.imageWidthFactor,
                      child: PageView(
                        scrollDirection: Axis.vertical,
                        controller: _pageController,
                        children: images
                            .map(
                              (e) => Container(
                                child: Image.network(
                                  e,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                  Align(
                    alignment: mobilePage
                        ? MobilePage.headTextAlign
                        : WebPage.headTextAlign,
                    child: Text(
                      'Artistic Work',
                      style: TextStyle(
                        fontSize: mobilePage
                            ? MobilePage.headTextFontSize
                            : WebPage.headTextFontSize,
                        fontFamily: "Times New Roman",
                      ),
                    ),
                  ),
                  Align(
                    alignment: mobilePage
                        ? MobilePage.subTextAlign
                        : WebPage.subTextAlign,
                    child: Container(
                      height: 100.0,
                      width: mobilePage
                          ? MobilePage.subTextContainerWidth
                          : WebPage.subTextContainerWidth,
                      child: Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, ut labore et dolore magna aliqua.',
                        style: TextStyle(
                          fontSize: 14.0,
                          wordSpacing: 3.0,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: NavBar(
                      mobilePage: mobilePage,
                    ),
                  ),
                  Align(
                    alignment: Alignment(0.72, 0.92),
                    child: PageIndicator(
                      prevButtonTap: () {
                        setState(() {
                          index = index - 1;
                          if (index < 0) {
                            index = 3;
                          }
                          _pageController.animateToPage(index,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeOut);
                          _colorController.animateToPage(index,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeOut);
                        });
                      },
                      nextButtonTap: () {
                        setState(() {
                          index = index + 1;
                          if (index > 3) {
                            index = 0;
                          }
                          _pageController.animateToPage(index,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeOut);
                          _colorController.animateToPage(index,
                              duration: Duration(milliseconds: 500),
                              curve: Curves.easeOut);
                        });
                      },
                    ),
                  ),
                  Align(
                    alignment: mobilePage
                        ? MobilePage.customButtonAlignment
                        : WebPage.customButtonAlignment,
                    child: CustomButton(
                      mobilePage: mobilePage,
                    ),
                  ),
                  Align(
                    alignment: Alignment.topLeft,
                    child: TopLeftButton(
                      mobilePage: mobilePage,
                    ),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
