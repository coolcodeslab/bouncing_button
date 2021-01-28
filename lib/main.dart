import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;

  double _scale;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 200),
    )..addListener(() {
        setState(() {});
      });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            width: double.infinity,
          ),
          Transform.scale(
            scale: _scale,
            child: GestureDetector(
              onTapDown: onTapDown,
              onTapUp: onTapUp,
              child: Container(
                height: 70,
                width: 200,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Colors.red, Colors.purple],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                    ),
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        offset: Offset(0.0, 5.0),
                        blurRadius: 30,
                      ),
                    ]),
                child: Center(
                  child: Text(
                    'Tap',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 26,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void onTapDown(TapDownDetails details) {
    _controller.forward();
    print(details);
  }

  void onTapUp(TapUpDetails details) {
    _controller.reverse();
    print(details);
  }
}
