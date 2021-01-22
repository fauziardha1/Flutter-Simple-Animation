import 'package:flutter/material.dart';

void main(List<String> args) {
  runApp(MaterialApp(home: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animation PageRoute Transition"),
      ),
      body: Container(
        color: Colors.yellow,
        child: Center(
          child: RaisedButton(
            color: Colors.blue,
            child: Text("Go to Next Page!"),
            onPressed: () {
              Navigator.of(context).push(_createPageRoute());
            },
          ),
        ),
      ),
    );
  }
}

Route _createPageRoute() {
  return PageRouteBuilder(
    pageBuilder: (contex, animation, secondaryAnimation) => SecondPage(),
    transitionsBuilder: (context, animation, secondaryAnimationm, child) {
      var begin = Offset(0, 1);
      var end = Offset.zero;

      // var curve = Curves.easeOut;
      // var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
      // var tween = Tween(begin: begin, end: end);
      // var offsetAnimation = animation.drive(tween);

      var curve = Curves.ease;
      var tween = Tween(begin: begin, end: end);
      var curvedAnimation = CurvedAnimation(curve: curve, parent: animation);

      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      );
    },
  );
}

class SecondPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Page"),
      ),
      body: Container(
        color: Colors.green,
        child: Center(child: Text("Second Page")),
      ),
    );
  }
}
